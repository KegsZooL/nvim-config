local null_ls = require('null-ls')
local util = require('lspconfig.util')

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
            dynamic_command = function(params)
                local root = util.root_pattern('pyproject.toml', 'setup.py', '.git')(params.bufname)
                if root then
                    local venv_mypy = root .. '/.venv/bin/mypy'
                    if vim.fn.executable(venv_mypy) == 1 then
                        return venv_mypy
                    end

                    venv_mypy = root .. '/venv/bin/mypy'
                    if vim.fn.executable(venv_mypy) == 1 then
                        return venv_mypy
                    end
                end
                return 'mypy'
            end,
        }),
        implement_interface_action,
    },
})
