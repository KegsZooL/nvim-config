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
            command = function(params)
                local root_dir = util.root_pattern("pyproject.toml")(params.bufname)
                if root_dir then
                    -- Check .venv
                    local venv_mypy = root_dir .. "/.venv/bin/mypy"
                    if vim.fn.filereadable(venv_mypy) == 1 then
                        return venv_mypy
                    end
                    -- Check pyenv virtualenv by project folder name
                    local project_name = vim.fn.fnamemodify(root_dir, ":t")
                    local pyenv_venv_mypy = vim.fn.expand("~/.pyenv/versions/" .. project_name .. "/bin/mypy")
                    if vim.fn.filereadable(pyenv_venv_mypy) == 1 then
                        return pyenv_venv_mypy
                    end
                    -- Check pyenv local version from .python-version
                    local python_version_file = root_dir .. "/.python-version"
                    if vim.fn.filereadable(python_version_file) == 1 then
                        local version = vim.fn.readfile(python_version_file)[1]
                        if version then
                            local pyenv_mypy = vim.fn.expand("~/.pyenv/versions/" .. version .. "/bin/mypy")
                            if vim.fn.filereadable(pyenv_mypy) == 1 then
                                return pyenv_mypy
                            end
                        end
                    end
                end
                return "mypy"
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
