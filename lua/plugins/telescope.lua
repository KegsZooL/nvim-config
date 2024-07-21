require('telescope').setup{
    defaults = {
        file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
            "%.pdf", "%.mkv", "%.mp4", "%.zip"},
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Live Grep Code" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Search Git Branches" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Search Git Commits" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Search Git Status"})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', 'gr', builtin.lsp_references,
               {noremap = true, silent = true})
vim.keymap.set('n', 'gd', builtin.lsp_definitions,
               {noremap = true, silent = true})     

               
