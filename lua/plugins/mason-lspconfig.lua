require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "jdtls", "pyright", "sqls", "marksman",
        "jsonls", "cssls", "html", "emmet_ls", "tailwindcss",
        "tsserver", "svelte", "graphql", "prismals"
    },
}
