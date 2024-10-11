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

keymap.set('n', '<A-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Commenting on lines
keymap.set('n', '<A-k>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
keymap.set('v', '<A-k>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap.set('i', '<A-k>', '<Esc>:lua require("Comment.api").toggle.linewise.current()<CR>gi', opts)

-- Save the current file
keymap.set('n', '<A-s>', ':w<CR>', opts)
keymap.set('v', '<A-s>', ':w<CR>', opts)
keymap.set('i', '<A-s>', '<Esc>:w<CR>a', opts)

-- Save all buffers
keymap.set('n', '<A-s-a>', ':wa<CR>', opts)
keymap.set('v', '<A-s-a>', ':wa<CR>', opts)
keymap.set('i', '<A-s-a>', '<Esc>:wa<CR>a', opts)

-- Switching to i-mode by enter
keymap.set('n', '<CR>', 'i<CR>', opts)

-- Tabulation in i-mode
keymap.set('n', '<Tab>', ':startinsert<CR><Tab>', opts)

-- Reverse tabulation
keymap.set('i', '<S-Tab>', '<C-d>', opts)
keymap.set('n', '<S-Tab>', ':startinsert<CR><C-d>', opts)

-- Tab from the beginning of the current line
keymap.set('n', '<C-Tab>', '0i<Tab><Esc>', opts)
keymap.set('i', '<C-Tab>', '<Esc>0i<Tab>', opts)

-- Adding/Removing tabs
keymap.set('v', '<Tab>', '>gv', opts)
keymap.set('v', '<S-Tab>', '<gv', opts)

-- Moving lines
keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)

keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)

keymap.set('i', '<A-k>', '<Esc>:MoveLine(-1)<CR>gi', opts)
keymap.set('i', '<A-j>', '<Esc>:MoveLine(1)<CR>gi', opts)

-- Exiting nvim
keymap.set('n', '<A-ESC>', ':q!<CR>', opts)
keymap.set('i', '<A-ESC>', '<Esc>:q!<CR>', opts)

-- Close current split window
keymap.set('n', '<A-q>', ':close<CR>', opts)
keymap.set('i', '<A-q>', '<Esc>:close<CR>:startinsert<CR>', opts)
keymap.set('v', '<A-q>', '<Esc>:close<CR>', opts)

-- Close current buffer
keymap.set('n', '<M-\\>', ':bd!<CR>', opts)
keymap.set('i', '<M-\\>', '<Esc>:bd!<CR>:startinsert<CR>', opts)
keymap.set('v', '<M-\\>', '<Esc>:bd!<CR>', opts)

-- Split the window
keymap.set('n', '<A-t>', '<Cmd>vsplit<CR>', opts)
keymap.set('i', '<A-t>', '<Cmd>vsplit<CR>', opts)

-- Change the focus in the current split window
keymap.set('n', '<A-=>', '<Cmd>wincmd k<CR>', opts)
keymap.set('n', '<A-->', '<Cmd>wincmd j<CR>', opts)
keymap.set('n', '<A-[>', '<Cmd>wincmd h<CR>', opts)
keymap.set('n', '<A-]>', '<Cmd>wincmd l<CR>', opts)

keymap.set('i', '<A-=>', '<Esc>:wincmd k<CR>', opts)
keymap.set('i', '<A-->', '<Esc>:wincmd j<CR>', opts)
keymap.set('i', '<A-[>', '<Esc>:wincmd h<CR>', opts)
keymap.set('i', '<A-]>', '<Esc>:wincmd l<CR>', opts)

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
keymap.set('n', '<M-h>', '<Cmd>bprev<CR>', opts)
keymap.set('n', '<M-l>', '<Cmd>bnext<CR>', opts)

-- Changing the size of a split window
keymap.set('n', '<H>', '<Cmd>vertical resize -2<CR>', opts)
keymap.set('n', '<J>', '<Cmd>resize +2<CR>', opts)
keymap.set('n', '<K>', '<Cmd>resize -2<CR>', opts)
keymap.set('n', '<L>', '<Cmd>vertical resize +2<CR>', opts)

-- NeoTree
keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', opts)
keymap.set('n', '<leader>ee', ':Neotree left reveal<CR>', opts)
keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', opts)

-- Lspsaga
keymap.set('n', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)
keymap.set('i', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)

keymap.set('n', '<A-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)
keymap.set('i', '<A-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)

keymap.set('n', '<A-q>', '<cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('i', '<A-q>', '<cmd>Lspsaga hover_doc<CR>', opts)

keymap.set('n', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('i', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)

keymap.set("n", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)
keymap.set("i", "<A-r>", "<cmd>Lspsaga rename<CR>", opts)

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

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>ds', '<Plug>(DBUI_ExecuteQuery)', opts)
    end
})
