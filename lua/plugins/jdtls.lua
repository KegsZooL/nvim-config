require('lspconfig').jdtls.setup({
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-22",
                        path = "/usr/lib/jvm/java-23-openjdk",
                        default = true,
                    }
                }
            }
        }
    },
})
