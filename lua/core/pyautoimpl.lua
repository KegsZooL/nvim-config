local M = {}

local ts = vim.treesitter

local function get_class_at_position(bufnr, row)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    if row == nil then
        local cursor = vim.api.nvim_win_get_cursor(0)
        row = cursor[1] - 1
    end

    local parser = ts.get_parser(bufnr, 'python')
    if not parser then return nil end

    local tree = parser:parse()[1]
    if not tree then return nil end

    local root = tree:root()

    local query = ts.query.parse('python', [[
        (class_definition
            name: (identifier) @class_name
            superclasses: (argument_list)? @superclasses
            body: (block) @body
        ) @class
    ]])

    for id, node in query:iter_captures(root, bufnr) do
        local name = query.captures[id]
        if name == 'class' then
            local start_row, _, end_row, _ = node:range()
            if row >= start_row and row <= end_row then
                local class_name_node = node:field('name')[1]
                local superclasses_node = node:field('superclasses')[1]
                local body_node = node:field('body')[1]

                local body_start, _, body_end, _ = body_node:range()

                return {
                    node = node,
                    name = ts.get_node_text(class_name_node, bufnr),
                    superclasses_node = superclasses_node,
                    body_node = body_node,
                    class_start_row = start_row,
                    body_start_row = body_start,
                    body_end_row = body_end,
                }
            end
        end
    end

    return nil
end

local function get_base_class_names(superclasses_node, bufnr)
    if not superclasses_node then return {} end

    local names = {}
    for child in superclasses_node:iter_children() do
        local node_type = child:type()
        if node_type == 'identifier' then
            table.insert(names, {
                name = ts.get_node_text(child, bufnr),
                node = child,
            })
        elseif node_type == 'subscript' then
            local value_node = child:field('value')[1]
            if value_node then
                local type_args = {}
                local subscript_nodes = child:field('subscript')
                for _, subscript_node in ipairs(subscript_nodes) do
                    table.insert(type_args, ts.get_node_text(subscript_node, bufnr))
                end
                table.insert(names, {
                    name = ts.get_node_text(value_node, bufnr),
                    node = value_node,
                    type_args = type_args,
                })
            end
        elseif node_type == 'attribute' then
            local attr_node = child:field('attribute')[1]
            local class_name = attr_node and ts.get_node_text(attr_node, bufnr) or ts.get_node_text(child, bufnr)
            table.insert(names, {
                name = class_name,
                node = child,
                full_name = ts.get_node_text(child, bufnr),
            })
        end
    end

    return names
end

local function merge_params(params1, params2)
    local function parse_params(params_str)
        local result = {}
        local inner = params_str:match('^%((.*)%)$') or params_str
        for param in inner:gmatch('[^,]+') do
            param = param:match('^%s*(.-)%s*$')
            local name, ptype = param:match('^([%w_]+):%s*(.+)$')
            if not name then
                name = param:match('^([%w_]+)$')
            end
            if name then
                table.insert(result, { name = name, type = ptype })
            end
        end
        return result
    end

    local p1 = parse_params(params1)
    local p2 = parse_params(params2)

    local merged = {}
    for i, param in ipairs(p1) do
        local other = p2[i]
        if other and param.type and other.type then
            if param.type ~= other.type then
                if not param.type:find(other.type, 1, true) then
                    param.type = param.type .. ' | ' .. other.type
                end
            end
        end
        table.insert(merged, param)
    end

    local parts = {}
    for _, param in ipairs(merged) do
        if param.type then
            table.insert(parts, param.name .. ': ' .. param.type)
        else
            table.insert(parts, param.name)
        end
    end
    return '(' .. table.concat(parts, ', ') .. ')'
end

local function find_class_type_params(root, source, class_name)
    local type_params = {}

    local query = ts.query.parse('python', [[
        (class_definition
            name: (identifier) @class_name
            type_parameters: (type_parameter
                (type) @type_param
            )?
        ) @class
    ]])

    for id, node in query:iter_captures(root, source, 0, -1) do
        local capture_name = query.captures[id]
        if capture_name == 'class' then
            local name_node = node:field('name')[1]
            if name_node and ts.get_node_text(name_node, source) == class_name then
                local type_params_node = node:field('type_parameters')[1]
                if type_params_node then
                    for child in type_params_node:iter_children() do
                        if child:type() == 'type' then
                            local param_text = ts.get_node_text(child, source)
                            local param_name = param_text:match('^([%w_]+)')
                            if param_name then
                                table.insert(type_params, param_name)
                            end
                        end
                    end
                end
            end
        end
    end

    return type_params
end

local function find_class_node(root, source, class_name)
    local query = ts.query.parse('python', [[
        (class_definition
            name: (identifier) @name
        ) @class
    ]])

    for id, node in query:iter_captures(root, source, 0, -1) do
        local capture_name = query.captures[id]
        if capture_name == 'class' then
            local name_node = node:field('name')[1]
            if name_node and ts.get_node_text(name_node, source) == class_name then
                return node
            end
        end
    end
    return nil
end

local function find_abstract_methods_in_file(filepath, class_name)
    local result = { methods = {}, type_params = {} }

    local content = vim.fn.readfile(filepath)
    if not content or #content == 0 then
        return result
    end

    local source = table.concat(content, '\n')
    local ok, parser = pcall(ts.get_string_parser, source, 'python')
    if not ok or not parser then
        return result
    end

    local tree = parser:parse()[1]
    if not tree then
        return result
    end

    local root = tree:root()

    result.type_params = find_class_type_params(root, source, class_name)

    local class_node = find_class_node(root, source, class_name)
    if not class_node then
        return result
    end

    local body_node = class_node:field('body')[1]
    if not body_node then
        return result
    end

    local query = ts.query.parse('python', [[
        (decorated_definition
            (decorator
                (identifier) @dec_name
            )
            definition: (function_definition
                name: (identifier) @func_name
                parameters: (parameters) @params
                return_type: (type)? @ret_type
            )
        ) @decorated
    ]])

    local method_variants = {}
    local processed_nodes = {}

    local class_start_row, _, class_end_row, _ = class_node:range()

    for id, node in query:iter_captures(root, source, 0, -1) do
        local capture_name = query.captures[id]

        if capture_name == 'decorated' then
            local node_start_row = node:range()
            if node_start_row < class_start_row or node_start_row > class_end_row then
                goto continue
            end

            local node_id = node:id()
            if processed_nodes[node_id] then
                goto continue
            end
            processed_nodes[node_id] = true

            local has_abstractmethod = false
            for child in node:iter_children() do
                if child:type() == 'decorator' then
                    local dec_text = ts.get_node_text(child, source)
                    if dec_text:match('abstractmethod') then
                        has_abstractmethod = true
                    end
                end
            end

            if has_abstractmethod then
                local func_node = node:field('definition')[1]
                if func_node then
                    local name_node = func_node:field('name')[1]
                    local params_node = func_node:field('parameters')[1]
                    local ret_node = func_node:field('return_type')[1]

                    local method_name = ts.get_node_text(name_node, source)
                    local params = ts.get_node_text(params_node, source)
                    local ret_type = ret_node and ts.get_node_text(ret_node, source) or nil

                    local func_text = ts.get_node_text(func_node, source)
                    local is_async = func_text:match('^async%s') ~= nil

                    if not method_variants[method_name] then
                        method_variants[method_name] = {
                            name = method_name,
                            is_async = is_async,
                            variants = {},
                        }
                    end
                    table.insert(method_variants[method_name].variants, {
                        params = params,
                        return_type = ret_type,
                    })
                end
            end
        end
        ::continue::
    end

    local plain_query = ts.query.parse('python', [[
        (function_definition
            name: (identifier) @func_name
            parameters: (parameters) @params
            return_type: (type)? @ret_type
            body: (block) @body
        ) @func
    ]])

    for id, node in plain_query:iter_captures(root, source, 0, -1) do
        local capture_name = plain_query.captures[id]

        if capture_name == 'func' then
            local node_start_row = node:range()
            if node_start_row < class_start_row or node_start_row > class_end_row then
                goto continue_plain
            end

            local parent = node:parent()
            if parent and parent:type() == 'decorated_definition' then
                goto continue_plain
            end

            local name_node = node:field('name')[1]
            local params_node = node:field('parameters')[1]
            local ret_node = node:field('return_type')[1]
            local func_body_node = node:field('body')[1]

            if name_node and func_body_node then
                local method_name = ts.get_node_text(name_node, source)

                if method_variants[method_name] then
                    goto continue_plain
                end

                local body_text = ts.get_node_text(func_body_node, source):match('^%s*(.-)%s*$')
                if body_text == '...' or body_text == 'pass' then
                    local params = ts.get_node_text(params_node, source)
                    local ret_type = ret_node and ts.get_node_text(ret_node, source) or nil

                    local func_text = ts.get_node_text(node, source)
                    local is_async = func_text:match('^async%s') ~= nil

                    method_variants[method_name] = {
                        name = method_name,
                        is_async = is_async,
                        variants = { { params = params, return_type = ret_type } },
                    }
                end
            end
        end
        ::continue_plain::
    end

    for method_name, method_info in pairs(method_variants) do
        local variants = method_info.variants
        if #variants == 1 then
            table.insert(result.methods, {
                name = method_name,
                params = variants[1].params,
                return_type = variants[1].return_type,
                is_async = method_info.is_async,
                overload_variants = nil,
            })
        else
            local merged_params = variants[1].params
            local merged_return = variants[1].return_type

            for i = 2, #variants do
                local v = variants[i]
                if v.return_type and merged_return then
                    if not merged_return:find(v.return_type, 1, true) then
                        merged_return = merged_return .. ' | ' .. v.return_type
                    end
                end
                merged_params = merge_params(merged_params, v.params)
            end

            table.insert(result.methods, {
                name = method_name,
                params = merged_params,
                return_type = merged_return,
                is_async = method_info.is_async,
                overload_variants = variants,
            })
        end
    end

    return result
end

local function get_base_class_definition(base_class_node, bufnr, callback)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local start_row, start_col = base_class_node:range()

    if base_class_node:type() == 'attribute' then
        for child in base_class_node:iter_children() do
            if child:type() == 'identifier' then
                start_row, start_col = child:range()
            end
        end
    end

    local params = {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
        position = { line = start_row, character = start_col },
    }

    vim.lsp.buf_request(bufnr, 'textDocument/definition', params, function(err, result)
        if err or not result or #result == 0 then
            callback(nil)
            return
        end

        local def = result[1]
        local uri = def.uri or def.targetUri
        local range = def.range or def.targetRange

        if uri and range then
            local filepath = vim.uri_to_fname(uri)
            callback({
                filepath = filepath,
                line = range.start.line,
            })
        else
            callback(nil)
        end
    end)
end

local function get_existing_methods(class_info, bufnr)
    local existing = {}
    local body_node = class_info.body_node

    local query = ts.query.parse('python', [[
        (function_definition
            name: (identifier) @method_name
        )
    ]])

    for id, node in query:iter_captures(body_node, bufnr) do
        local name = query.captures[id]
        if name == 'method_name' then
            existing[ts.get_node_text(node, bufnr)] = true
        end
    end

    return existing
end

local function generate_method_stub(method, indent)
    local lines = {}
    local async_prefix = method.is_async and 'async ' or ''

    if method.overload_variants and #method.overload_variants > 1 then
        for _, variant in ipairs(method.overload_variants) do
            table.insert(lines, indent .. '@overload')
            local sig = indent .. async_prefix .. 'def ' .. method.name .. variant.params
            if variant.return_type then
                sig = sig .. ' -> ' .. variant.return_type .. ': ...'
            else
                sig = sig .. ': ...'
            end
            table.insert(lines, sig)
            table.insert(lines, '')
        end
    end

    local signature = indent .. async_prefix .. 'def ' .. method.name .. method.params
    if method.return_type then
        signature = signature .. ' -> ' .. method.return_type .. ':'
    else
        signature = signature .. ':'
    end

    table.insert(lines, signature)
    table.insert(lines, indent .. '    raise NotImplementedError')
    table.insert(lines, '')

    return lines
end

function M.implement(saved_bufnr, saved_row)
    local bufnr = saved_bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= 'python' then
        vim.notify('Not a Python file', vim.log.levels.WARN)
        return
    end

    local class_info = get_class_at_position(bufnr, saved_row)
    if not class_info then
        vim.notify('No class found at cursor', vim.log.levels.WARN)
        return
    end

    if not class_info.superclasses_node then
        vim.notify('Class has no base classes', vim.log.levels.INFO)
        return
    end

    local base_classes = get_base_class_names(class_info.superclasses_node, bufnr)
    if #base_classes == 0 then
        vim.notify('No base classes found', vim.log.levels.INFO)
        return
    end

    local existing_methods = get_existing_methods(class_info, bufnr)
    local all_abstract_methods = {}
    local pending = #base_classes

    for _, base_class in ipairs(base_classes) do
        get_base_class_definition(base_class.node, bufnr, function(def)
            pending = pending - 1

            if def then
                local result = find_abstract_methods_in_file(def.filepath, base_class.name)
                local methods = result.methods
                local type_params = result.type_params
                local type_args = base_class.type_args or {}

                local type_map = {}
                for i, param in ipairs(type_params) do
                    if type_args[i] then
                        type_map[param] = type_args[i]
                    end
                end

                for _, method in ipairs(methods) do
                    if not existing_methods[method.name] then
                        local function apply_type_map(str)
                            if not str then return nil end
                            for param, arg in pairs(type_map) do
                                str = str:gsub('%f[%w]' .. param .. '%f[%W]', arg)
                            end
                            return str
                        end

                        local params = apply_type_map(method.params)
                        local ret_type = apply_type_map(method.return_type)

                        local overload_variants = nil
                        if method.overload_variants then
                            overload_variants = {}
                            for _, v in ipairs(method.overload_variants) do
                                table.insert(overload_variants, {
                                    params = apply_type_map(v.params),
                                    return_type = apply_type_map(v.return_type),
                                })
                            end
                        end

                        all_abstract_methods[method.name] = {
                            name = method.name,
                            params = params,
                            return_type = ret_type,
                            is_async = method.is_async,
                            overload_variants = overload_variants,
                        }
                    end
                end
            end

            if pending == 0 then
                vim.schedule(function()
                    local methods_list = vim.tbl_values(all_abstract_methods)

                    if #methods_list == 0 then
                        vim.notify('No abstract methods to implement', vim.log.levels.INFO)
                        return
                    end

                    local class_start_row = class_info.class_start_row
                    local body_start_row = class_info.body_start_row
                    local body_end_row = class_info.body_end_row

                    local class_line = vim.api.nvim_buf_get_lines(bufnr, class_start_row, class_start_row + 1, false)[1]
                    local class_indent = class_line:match('^(%s*)') or ''
                    local method_indent = class_indent .. '    '

                    local body_lines = vim.api.nvim_buf_get_lines(bufnr, body_start_row, body_end_row + 1, false)
                    local body_is_placeholder = false
                    local placeholder_row = nil

                    if #body_lines > 0 then
                        local non_empty_count = 0
                        local placeholder_line_idx = nil
                        for i, line in ipairs(body_lines) do
                            local trimmed = line:match('^%s*(.-)%s*$')
                            if trimmed ~= '' then
                                non_empty_count = non_empty_count + 1
                                if trimmed == 'pass' or trimmed == '...' or trimmed:match('^pass%s*#') or trimmed:match('^%.%.%.%s*#') then
                                    placeholder_line_idx = i
                                end
                            end
                        end
                        if non_empty_count == 1 and placeholder_line_idx then
                            body_is_placeholder = true
                            placeholder_row = body_start_row + placeholder_line_idx - 1
                        end
                    end

                    local lines_to_insert = {}
                    for _, method in ipairs(methods_list) do
                        local stub = generate_method_stub(method, method_indent)
                        vim.list_extend(lines_to_insert, stub)
                    end

                    if body_is_placeholder and placeholder_row then
                        vim.api.nvim_buf_set_lines(bufnr, placeholder_row, placeholder_row + 1, false, lines_to_insert)
                    elseif body_start_row == class_start_row then
                        local insert_row = class_start_row + 1
                        vim.api.nvim_buf_set_lines(bufnr, insert_row, insert_row, false, lines_to_insert)
                    else
                        local insert_row = body_end_row + 1
                        table.insert(lines_to_insert, 1, '')
                        vim.api.nvim_buf_set_lines(bufnr, insert_row, insert_row, false, lines_to_insert)
                    end

                    vim.notify(
                        string.format('Implemented %d abstract method(s)', #methods_list),
                        vim.log.levels.INFO
                    )
                end)
            end
        end)
    end
end

function M.setup()
    vim.api.nvim_create_user_command('PyAutoImpl', function()
        M.implement()
    end, {})

    vim.lsp.commands['pyautoimpl'] = function()
        M.implement()
    end
end

return M
