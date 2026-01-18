local null_ls = require('null-ls')
local util = require('lspconfig.util')

-- Custom code action: Implement abstract methods
local implement_interface_action = {
    name = 'implement-interface',
    method = null_ls.methods.CODE_ACTION,
    filetypes = { 'python' },
    generator = {
        fn = function(params)
            local ts = vim.treesitter
            local bufnr = params.bufnr
            local row = params.range.row - 1

            local ok, parser = pcall(ts.get_parser, bufnr, 'python')
            if not ok or not parser then return end

            local tree = parser:parse()[1]
            if not tree then return end

            local root = tree:root()
            local query = ts.query.parse('python', [[
                (class_definition
                    superclasses: (argument_list)
                ) @class
            ]])

            for _, node in query:iter_captures(root, bufnr) do
                local start_row, _, end_row, _ = node:range()
                if row >= start_row and row <= end_row then
                    -- Сохраняем контекст для передачи в action
                    local saved_bufnr = bufnr
                    local saved_row = row
                    return {
                        {
                            title = 'Implement abstract methods',
                            action = function()
                                require('core.pyautoimpl').implement(saved_bufnr, saved_row)
                            end,
                        },
                    }
                end
            end
        end,
    },
}

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy.with({
            condition = function(utils)
                return utils.root_has_file({ "pyproject.toml", "mypy.ini", ".mypy.ini" })
            end,
            cwd = function(params)
                return util.root_pattern("pyproject.toml", "mypy.ini", ".mypy.ini")(params.bufname)
                    or vim.fn.getcwd()
            end,
            extra_args = function(params)
                local root_dir = util.root_pattern("pyproject.toml")(params.bufname)
                if root_dir then
                    return { "--config-file", root_dir .. "/pyproject.toml" }
                else
                    return {}
                end
            end,
        }),
        implement_interface_action,
    },
})
