local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Disabling arrows
keymap.set('n', '<Up>', '<Nop>', opts)
keymap.set('n', '<Down>', '<Nop>', opts)
keymap.set('n', '<Left>', '<Nop>', opts)
keymap.set('n', '<Right>', '<Nop>', opts)

keymap.set('i', '<Up>', '<Nop>', opts)
keymap.set('i', '<Down>', '<Nop>', opts)
keymap.set('i', '<Left>', '<Nop>', opts)
keymap.set('i', '<Right>', '<Nop>', opts)

keymap.set('v', '<Up>', '<Nop>', opts)
keymap.set('v', '<Down>', '<Nop>', opts)
keymap.set('v', '<Left>', '<Nop>', opts)
keymap.set('v', '<Right>', '<Nop>', opts)

keymap.set('n', '<A-y>', ':t.<CR>', opts)
keymap.set('x', '<A-y>', ":t'><CR>", opts)

keymap.set('n', 'dd', '"_dd', opts)
keymap.set('v', 'd', '"_d', opts)

keymap.set('n', 's', '"_s', opts)
keymap.set('v', 's', '"_s', opts)

keymap.set('n', 'daw', '"_daw', opts)

keymap.set('n', '<C-w>', 'vi', opts)
keymap.set('n', '<C-S-w>', 'va', opts)

-- Commenting on lines
keymap.set('n', '<A-\'>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
keymap.set('v', '<A-\'>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap.set('i', '<A-\'>', '<Esc>:lua require("Comment.api").toggle.linewise.current()<CR>gi', opts)

-- Save the current file
keymap.set('n', '<C-s>', ':w<CR>', opts)
keymap.set('v', '<C-s>', ':w<CR>', opts)
keymap.set('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- Save all buffers
keymap.set('n', '<C-s-a>', ':wa<CR>', opts)
keymap.set('v', '<C-s-a>', ':wa<CR>', opts)
keymap.set('i', '<C-s-a>', '<Esc>:wa<CR>a', opts)

-- Tabulation
keymap.set('n', '<Tab>', ':normal! I<Tab><CR>', opts)
keymap.set('v', '<Tab>', '>gv', opts)

-- Reverse tabulation
keymap.set('n', '<S-Tab>', '<<', opts)
keymap.set('v', '<S-Tab>', '<gv', opts)

-- Tab from the beginning of the current line
keymap.set('n', '<C-Tab>', ':normal! I<Tab><CR>', opts)

-- Exiting nvim
keymap.set('n', '<A-ESC>', ':q!<CR>', opts)
keymap.set('i', '<A-ESC>', '<Esc>:q!<CR>', opts)

-- Close current split window
keymap.set('n', '<A-q>', ':close<CR>:wincmd p<CR>', opts)
keymap.set('i', '<A-q>', '<Esc>:close<CR>:wincmd p<CR>', opts)
keymap.set('v', '<A-q>', '<Esc>:close<CR>:wincmd p<CR>', opts)

-- Close current buffer
keymap.set('n', '<M-\\>', ':bd!<CR>:bprevious<CR>', opts)
keymap.set('i', '<M-\\>', '<Esc>:bd!<CR>:bprevious<CR>', opts)
keymap.set('v', '<M-\\>', '<Esc>:bd!<CR>:bprevious<CR>', opts)

-- Split the window
keymap.set('n', '<A-t>', '<Cmd>vsplit<CR>', opts)
keymap.set('i', '<A-t>', '<Cmd>vsplit<CR>', opts)

-- Change the focus in the current split window
keymap.set('n', '<A-a>', '<Cmd>wincmd h<CR>')
keymap.set('n', '<A-e>', '<Cmd>wincmd k<CR>')
keymap.set('n', '<A-d>', '<Cmd>wincmd j<CR>')
keymap.set('n', '<A-s>', '<Cmd>wincmd l<CR>')

keymap.set('i', '<A-a>', '<Esc><Cmd>wincmd h<CR>')
keymap.set('i', '<A-e>', '<Esc><Cmd>wincmd k<CR>')
keymap.set('i', '<A-d>', '<Esc><Cmd>wincmd j<CR>')
keymap.set('i', '<A-s>', '<Esc><Cmd>wincmd l<CR>')

-- Move the current split window up
keymap.set('n', '<C-K>', '<C-w>K', opts)
keymap.set('i', '<C-K>', '<Esc><C-w>K', opts)
keymap.set('v', '<C-K>', '<Esc><C-w>K', opts)

-- Move the current split window down 
keymap.set('n', '<C-J>', '<C-w>J', opts)
keymap.set('i', '<C-J>', '<Esc><C-w>J', opts)
keymap.set('v', '<C-J>', '<Esc><C-w>J', opts)

-- Move the current split window to the left side
keymap.set('n', '<C-H>', '<C-w>H', opts)
keymap.set('i', '<C-H>', '<Esc><C-w>H', opts)
keymap.set('v', '<C-H>', '<Esc><C-w>H', opts)

-- Move the current split window to the right side
keymap.set('n', '<C-L>', '<C-w>L', opts)
keymap.set('i', '<C-L>', '<Esc><C-w>L', opts)
keymap.set('v', '<C-L>', '<Esc><C-w>L', opts)

-- Moving between buffers in the current split window
keymap.set('n', '<M-n>', '<Cmd>bprev<CR>', opts)
keymap.set('n', '<M-m>', '<Cmd>bnext<CR>', opts)

-- Changing the size of a split window
keymap.set('n', '<A-->', '<Cmd>resize -2<CR>', opts)
keymap.set('n', '<A-=>', '<Cmd>resize +2<CR>', opts)
keymap.set('n', '<A-,>', '<Cmd>vertical resize -2<CR>', opts)
keymap.set('n', '<A-.>', '<Cmd>vertical resize +2<CR>', opts)

-- NeoTree
keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', opts)
keymap.set('n', '<leader>ee', ':Neotree left reveal<CR>', opts)
keymap.set('n', '<leader>eg', ':Neotree float git_status<CR>', opts)

-- Lspsaga
keymap.set('n', '<A-c>', '<cmd>Lspsaga goto_definition<CR>', opts)
keymap.set('i', '<A-c>', '<cmd>Lspsaga goto_definition<CR>', opts)

keymap.set('n', '<A-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)
keymap.set('i', '<A-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)

keymap.set('n', '<A-z>', '<cmd>Lspsaga finder imp<CR>', opts)
keymap.set('i', '<A-z>', '<cmd>Lspsaga finder imp<CR>', opts)

keymap.set('n', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('i', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)

keymap.set("n", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)
keymap.set("i", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)

-- Lsp actions
keymap.set('n', '<A-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap.set('n', '<A-o>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
keymap.set('i', '<A-o>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find text" })
keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git branches" })
keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git commits" })
keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git status" })
keymap.set('n', '<leader>em', ':Telescope emoji<CR>', { desc = "Search and insert emoji" })
keymap.set('n', '<leader>ne', ':Telescope nerdy<CR>', { desc = "Search and insert nerd font glyphs" })
keymap.set('n', '<leader>nn', ':Telescope notify<CR>' )

-- TODO
keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>', opts)
keymap.set('i', '<leader>td', '<cmd>TodoTelescope<CR>', opts)

-- Colortils
keymap.set('n', '<leader>cp', '<cmd>Colortils picker blue<CR>', opts)
keymap.set('n', '<leader>cl', '<cmd>Colortils css list<CR>', opts)

--DBUI
keymap.set('n', '<leader>d', '<cmd>Neotree close<CR><cmd>DBUIToggle<CR>', opts)
keymap.set('i', '<leader>d', '<cmd>Neotree close<CR>DBUIToggle<CR>', opts)

keymap.set('n', '<leader>dc', '<cmd>DBUIAddConnection<CR>', opts)
keymap.set('i', '<leader>dc', '<cmd>DBUIAddConnection<CR>', opts)

-- Markdown preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreview<CR>", opts)

-- Database UI
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ds', '<Plug>(DBUI_ExecuteQuery)', opts)
    end
})


-- DAP
local dap = require("dap")

keymap.set('n', '<A-p>', dap.toggle_breakpoint, opts)
keymap.set('n', '<F11>', dap.step_over, opts)
keymap.set('n', '<F1>', dap.step_into, opts)
keymap.set('n', '<F10>', dap.continue, opts)

-- Dashboard
keymap.set('n', '<leader>hh', ':Dashboard<CR>', opts)

-- Gitsigns
keymap.set('n', 'GG', '<cmd>Gitsigns preview_hunk_inline<CR>', opts)
keymap.set('n', 'gG', '<cmd>Gitsigns preview_hunk<CR>', opts)
keymap.set('n', 'gn', ':silent! Gitsigns nav_hunk next<CR>', opts)
keymap.set('n', 'gp', ':silent! Gitsigns nav_hunk prev<CR>', opts)
