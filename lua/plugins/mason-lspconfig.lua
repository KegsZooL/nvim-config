require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "pyright", "basedpyright",
        "graphql", "ruff", "gopls",
    },
}
