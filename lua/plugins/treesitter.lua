require'nvim-treesitter'.setup {
    ensure_installed = {
        "java", "lua", "vim", "vimdoc",
        "gitignore", "markdown", "markdown_inline",
        "css", "sql", "go", "json", "yaml", "jinja", "python"
    },
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft ~= "csv" then
            pcall(vim.treesitter.start, args.buf)
        end
    end,
})
