local null_ls = require('null-ls')
local util = require('lspconfig.util')
null_ls.setup({
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.mypy.with({
        extra_args = function()
            local root_dir = util.root_pattern("pyproject.toml")(vim.fn.getcwd())
            if root_dir then
                return { "--config-file", root_dir .. "/pyproject.toml" }
            else
                return {}
            end
        end
    }),
})
