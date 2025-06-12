require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "pyright", "marksman",
        "jsonls", "cssls", "tailwindcss",
        "svelte", "graphql", "prismals",
        "ruff", 'jinja_lsp', "basedpyright",
        "gopls",
    },
}
