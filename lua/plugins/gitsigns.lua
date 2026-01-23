local ok, gitsigns = pcall(require, "gitsigns")
if not ok then return end

gitsigns.setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,  -- add delay for performance
        virt_text_pos = 'eol',
    },
    numhl = true,
    max_file_length = 10000,  -- disable for files > 10000 lines
    update_debounce = 200,    -- debounce updates
})
