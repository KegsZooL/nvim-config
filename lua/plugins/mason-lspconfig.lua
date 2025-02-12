require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "jdtls", "pyright", "marksman",
        "jsonls", "cssls", "html", "emmet_ls", "tailwindcss",
        "svelte", "graphql", "prismals", "matlab_ls", "asm_lsp"
    },
}
