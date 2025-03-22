require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls", "jdtls", "pyright", "marksman",
        "jsonls", "cssls", "tailwindcss",
        "svelte", "graphql", "prismals", "matlab_ls", "asm_lsp",
        "ruff", 'jinja_lsp', "basedpyright",
    },
}
