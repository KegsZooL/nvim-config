local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})

-- java
lspconfig.jdtls.setup({
    capabilities = capabilities
})

-- python
lspconfig.pyright.setup({})

-- markdown
lspconfig.marksman.setup({})

lspconfig.jsonls.setup({
  capabilities = capabilities,
})

lspconfig.sqls.setup({})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.html.setup({
  capabilities = capabilities,
})
