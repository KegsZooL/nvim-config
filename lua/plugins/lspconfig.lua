local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- setup the lua language server
lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
