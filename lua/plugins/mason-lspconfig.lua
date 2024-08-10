require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "jdtls", "pyright", "sqls", "marksman",
        "jsonls", "cssls", "html",
    },
}
