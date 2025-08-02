local null_ls = require('null-ls')

local opts = {
    source = {
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.mypy
    }
}
return opts
