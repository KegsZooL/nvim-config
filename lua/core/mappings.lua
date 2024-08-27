local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('v', 'p', 'P', opts)
keymap.set('n', 'p', 'P', opts)

keymap.set('n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

keymap.set('n', '<BS>', '<Del>', opts)
keymap.set('v', '<BS>', '<Del>', opts)

-- Undo
keymap.set('n', '<C-z>', 'u', opts)
keymap.set('v', '<C-z>', 'u', opts)
keymap.set('i', '<C-z>', '<C-o>:undo<CR>', opts)

keymap.set('n', '<C-S-z>', '<C-r>', opts)
keymap.set('v', '<C-S-z>', '<C-r>', opts)
keymap.set('i', '<C-S-z>', '<C-o>:redo<CR>', opts)

-- Removing text
keymap.set('n', '<C-l>', '"_dd', opts)
keymap.set('v', '<C-l>', '"_d', opts)
keymap.set('i', '<C-l>', '<Esc>"_ddi', opts)

-- Paste down the current line
keymap.set('n', '<C-d>', ':t.<CR>', opts)
keymap.set('v', '<C-d>', ':t \'><CR>gv', opts)
keymap.set('i', '<C-d>', '<Esc>:t.<CR>gi', opts)

-- Moving by words
keymap.set('n', '<C-Left>', 'b', opts)
keymap.set('v', '<C-Left>', 'b', opts)
keymap.set('i', '<C-Left>', '<C-o>b', opts)

keymap.set('n', '<C-Right>', 'w', opts)
keymap.set('v', '<C-Right>', 'w', opts)
keymap.set('i', '<C-Right>', '<C-o>w', opts)

-- Commenting on lines
keymap.set('n', '<C-k>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
keymap.set('v', '<C-k>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap.set('i', '<C-k>', '<Esc>:lua require("Comment.api").toggle.linewise.current()<CR>gi', opts)

-- Save the current file
keymap.set('n', '<C-S>', ':w<CR>', opts)
keymap.set('v', '<C-S>', ':w<CR>', opts)
keymap.set('i', '<C-S>', '<Esc>:w<CR>a', opts)

-- Save all buffers
keymap.set('n', '<C-A-s>', ':wa<CR>', opts)
keymap.set('v', '<C-A-s>', ':wa<CR>', opts)
keymap.set('i', '<C-A-s>', '<Esc>:wa<CR>a', opts)

-- Modes for the ru keyboard
keymap.set('n', 'ш', 'i', opts)
keymap.set('n', 'Ш', 'i', opts)
keymap.set('v', 'ш', 'i', opts)
keymap.set('v', 'Ш', 'i', opts)

keymap.set('n', 'м', 'v', opts)
keymap.set('n', 'М', 'v', opts)
keymap.set('i', 'м', 'v', opts)
keymap.set('i', 'М', 'v', opts)

-- Text selection
keymap.set('n', '<S-Left>', 'v<Left>', opts)
keymap.set('n', '<S-Right>', 'v<Right>', opts)
keymap.set('n', '<S-Up>', 'v<Up>', opts)
keymap.set('n', '<S-Down>', 'v<Down>', opts)

keymap.set('v', '<S-Left>', '<Left>', opts)
keymap.set('v', '<S-Right>', '<Right>', opts)
keymap.set('v', '<S-Up>', '<Up>', opts)
keymap.set('v', '<S-Down>', '<Down>', opts)

keymap.set('i', '<S-Left>', '<Esc>v<Left>a', opts)
keymap.set('i', '<S-Right>', '<Esc>v<Right>a', opts)
keymap.set('i', '<S-Up>', '<Esc>v<Up>a', opts)
keymap.set('i', '<S-Down>', '<Esc>v<Down>a', opts)

-- Selecting the whole word
keymap.set('i', '<S-C-Left>', '<Esc>:normal! vwb<CR>a', opts)
keymap.set('i', '<S-C-Right>', '<Esc>:normal! vwe<CR>a', opts)

-- Copy/Paste
keymap.set('n', '<C-c>', 'vy<Esc>', opts)
keymap.set('v', '<C-c>', '"+y', opts)

keymap.set('n', '<C-v>', '"+p', opts)
keymap.set('v', '<C-v>', '"_dP', opts)
keymap.set('i', '<C-v>', '<Esc>"+pa', opts)

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
keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)

keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)

keymap.set('i', '<A-Up>', '<Esc>:MoveLine(-1)<CR>gi', opts)
keymap.set('i', '<A-Down>', '<Esc>:MoveLine(1)<CR>gi', opts)

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
keymap.set('n', '<C-A-Tab>', '<Cmd>vsplit<CR>', opts)
keymap.set('i', '<C-A-Tab>', '<Cmd>vsplit<CR>', opts)

-- Move the current split window up
keymap.set('n', '<C-A-D-Up>', '<C-w>K', opts)
keymap.set('i', '<C-A-D-Up>', '<Esc><C-w>K', opts)
keymap.set('v', '<C-A-D-Up>', '<Esc><C-w>K', opts)

-- Change the focus in the current split window
keymap.set('n', '<C-A-Up>', '<Cmd>wincmd k<CR>', opts)
keymap.set('n', '<C-A-Down>', '<Cmd>wincmd j<CR>', opts)
keymap.set('n', '<C-A-Left>', '<Cmd>wincmd h<CR>', opts)
keymap.set('n', '<C-A-Right>', '<Cmd>wincmd l<CR>', opts)

keymap.set('i', '<C-A-Up>', '<Esc>:wincmd k<CR>', opts)
keymap.set('i', '<C-A-Down>', '<Esc>:wincmd j<CR>', opts)
keymap.set('i', '<C-A-Left>', '<Esc>:wincmd h<CR>', opts)
keymap.set('i', '<C-A-Right>', '<Esc>:wincmd l<CR>', opts)

-- Move the current split window down 
keymap.set('n', '<C-A-D-Down>', '<C-w>J', opts)
keymap.set('i', '<C-A-D-Down>', '<Esc><C-w>J', opts)
keymap.set('v', '<C-A-D-Down>', '<Esc><C-w>J', opts)

-- Move the current split window to the left side
keymap.set('n', '<C-A-D-Left>', '<C-w>H', opts)
keymap.set('i', '<C-A-D-Left>', '<Esc><C-w>H', opts)
keymap.set('v', '<C-A-D-Left>', '<Esc><C-w>H', opts)

-- Move the current split window to the right side
keymap.set('n', '<C-A-D-Right>', '<C-w>L', opts)
keymap.set('i', '<C-A-D-Right>', '<Esc><C-w>L', opts)
keymap.set('v', '<C-A-D-Right>', '<Esc><C-w>L', opts)

-- Moving between buffers in the current split window
keymap.set('n', '<M-Left>', '<Cmd>bprev<CR>', opts)
keymap.set('n', '<M-Right>', '<Cmd>bnext<CR>', opts)

-- Changing the size of a split window
keymap.set('n', '<A-h>', '<Cmd>vertical resize -2<CR>', opts)
keymap.set('n', '<A-j>', '<Cmd>resize +2<CR>', opts)
keymap.set('n', '<A-k>', '<Cmd>resize -2<CR>', opts)
keymap.set('n', '<A-l>', '<Cmd>vertical resize +2<CR>', opts)

-- Deleting the entire word using CTRL + Backspace
keymap.set('n', '<C-BS>', 'daw', opts)
keymap.set('v', '<C-BS>', 'daw', opts)
keymap.set('i', '<C-BS>', '<C-W>', opts)

-- NeoTree
keymap.set('n', '<leader>E', ':Neotree float reveal<CR>', opts)
keymap.set('n', '<leader>ee', ':Neotree left reveal<CR>', opts)
keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', opts)

-- Lspsaga
keymap.set('n', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)
keymap.set('i', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)

keymap.set('n', '<C-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)
keymap.set('i', '<C-f>', '<cmd>Lspsaga finder def+ref<CR>', opts)

keymap.set('n', '<C-q>', '<cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('i', '<C-q>', '<cmd>Lspsaga hover_doc<CR>', opts)

keymap.set('n', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('i', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)

keymap.set("n", "<C-r>", "<cmd>Lspsaga rename<CR>", opts)
keymap.set("i", "<C-r>", "<cmd>Lspsaga rename<CR>", opts)

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
keymap.set('n', '<leader>cp', ':Colortils picker blue<CR>', opts)
keymap.set('n', '<leader>cl', '<cmd>Colortils css list<CR>', opts)
