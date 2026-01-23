require'nvim-treesitter'.setup {
    ensure_installed = {
        "java", "lua", "vim", "vimdoc",
        "gitignore", "markdown", "markdown_inline",
        "css", "sql", "go", "json", "yaml", "jinja", "python"
    },
}

-- Large file threshold (bytes)
local LARGE_FILE_SIZE = 1024 * 1024  -- 1MB

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        if ft == "csv" then
            return
        end

        -- Disable treesitter for large files
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        local ok, stats = pcall(vim.uv.fs_stat, bufname)
        if ok and stats and stats.size > LARGE_FILE_SIZE then
            vim.notify("Treesitter disabled for large file", vim.log.levels.WARN)
            return
        end

        pcall(vim.treesitter.start, args.buf)
    end,
})
