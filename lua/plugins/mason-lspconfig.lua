require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "pylsp", "graphql",
        "ruff", "gopls",
    },
}
