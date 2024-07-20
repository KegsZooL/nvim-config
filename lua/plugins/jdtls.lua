require('lspconfig').jdtls.setup({
    settings = {
        java = {
            configuration = {
                runtimes = {
                {
                    name = "JavaSE-22",
                    path = "/usr/lib/jvm/java-22-openjdk",
                    default = true,
                }
                }
            }
        }
    },
    capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
})