require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "pylsp", "graphql",
        "ruff", "gopls", "golangci_lint_ls","jsonls",
        "jinja_lsp"
    },
}
