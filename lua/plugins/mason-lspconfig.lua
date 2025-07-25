require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "pylsp", "graphql",
        "ruff", "gopls", "jsonls", "ts_ls",
        "jinja_lsp", "dockerls", "bashls", "yamlls"
    },
}
