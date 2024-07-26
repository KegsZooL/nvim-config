local keymap = vim.keymap
local api = vim.api
local opts = { noremap = true, silent = true }

-- Undo
api.nvim_set_keymap('n', '<C-z>', 'u', opts)
api.nvim_set_keymap('v', '<C-z>', 'u', opts)
api.nvim_set_keymap('i', '<C-z>', '<C-o>:undo<CR>', opts)

api.nvim_set_keymap('n', '<C-S-z>', '<C-r>', opts)
api.nvim_set_keymap('v', '<C-S-z>', '<C-r>', opts)
api.nvim_set_keymap('i', '<C-S-z>', '<C-o>:redo<CR>', opts)

-- Removing text
api.nvim_set_keymap('n', '<C-l>', '"_dd', opts)
api.nvim_set_keymap('v', '<C-l>', '"_d', opts)
api.nvim_set_keymap('i', '<C-l>', '<Esc>"_ddi', opts)

-- Paste down the current line
api.nvim_set_keymap('n', '<C-d>', 'yyp', opts)
api.nvim_set_keymap('v', '<C-d>', 'y`>p', opts)
api.nvim_set_keymap('i', '<C-d>', '<Esc>:call append(line("."), getline("."))<CR>a', opts)

-- Moving by words
api.nvim_set_keymap('n', '<C-Left>', 'b', opts)
api.nvim_set_keymap('v', '<C-Left>', 'b', opts)
api.nvim_set_keymap('i', '<C-Left>', '<C-o>b', opts)

api.nvim_set_keymap('n', '<C-Right>', 'w', opts)
api.nvim_set_keymap('v', '<C-Right>', 'w', opts)
api.nvim_set_keymap('i', '<C-Right>', '<C-o>w', opts)

-- Commenting on lines
api.nvim_set_keymap('n', '<C-k>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
api.nvim_set_keymap('v', '<C-k>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Save the current file
api.nvim_set_keymap('n', '<C-S>', ':w<CR>', opts)
api.nvim_set_keymap('v', '<C-S>', ':w<CR>', opts)
api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>a', opts)

api.nvim_set_keymap('v', '<BS>', '<Del>', opts)

-- Modes for the ru keyboard
api.nvim_set_keymap('n', 'ш', 'i', opts)
api.nvim_set_keymap('n', 'Ш', 'i', opts)
api.nvim_set_keymap('v', 'ш', 'i', opts)
api.nvim_set_keymap('v', 'Ш', 'i', opts)

api.nvim_set_keymap('n', 'м', 'v', opts)
api.nvim_set_keymap('n', 'М', 'v', opts)
api.nvim_set_keymap('i', 'м', 'v', opts)
api.nvim_set_keymap('i', 'М', 'v', opts)

-- Text selection
api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', opts)
api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', opts)
api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', opts)
api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', opts)

api.nvim_set_keymap('v', '<S-Left>', '<Left>', opts)
api.nvim_set_keymap('v', '<S-Right>', '<Right>', opts)
api.nvim_set_keymap('v', '<S-Up>', '<Up>', opts)
api.nvim_set_keymap('v', '<S-Down>', '<Down>', opts)

api.nvim_set_keymap('i', '<S-Left>', '<Esc>v<Left>a', opts)
api.nvim_set_keymap('i', '<S-Right>', '<Esc>v<Right>a', opts)
api.nvim_set_keymap('i', '<S-Up>', '<Esc>v<Up>a', opts)
api.nvim_set_keymap('i', '<S-Down>', '<Esc>v<Down>a', opts)

-- Selecting the entire word
api.nvim_set_keymap('i', '<S-C-Left>', '<Esc>:normal! vwb<CR>a', opts)
api.nvim_set_keymap('i', '<S-C-Right>', '<Esc>:normal! vwe<CR>a', opts)

-- Copy/Paste
api.nvim_set_keymap('n', '<C-c>', '"+y', opts)
api.nvim_set_keymap('v', '<C-c>', '"+y', opts)

api.nvim_set_keymap('n', '<C-v>', '"+p', opts)
api.nvim_set_keymap('v', '<C-v>', '"+p', opts)
api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', opts)

-- Switching to i-mode by enter
api.nvim_set_keymap('n', '<CR>', 'i<CR>', opts)

-- Tabulation in i-mode
api.nvim_set_keymap('n', '<Tab>', ':startinsert<CR><Tab>', opts)

-- Reverse tabulation
api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', opts)
api.nvim_set_keymap('n', '<S-Tab>', ':startinsert<CR><C-d>', opts)

-- Change the focus in the current split window
api.nvim_set_keymap('n', '<C-A-Up>', '<Cmd>wincmd k<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Down>', '<Cmd>wincmd j<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Left>', '<Cmd>wincmd h<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Right>', '<Cmd>wincmd l<CR>', { silent = true })

api.nvim_set_keymap('n', '<BS>', '<Del>', opts)

-- Adding tabs
api.nvim_set_keymap('v', '<Tab>', '>gv', opts)

-- Removing tabs 
api.nvim_set_keymap('v', '<S-Tab>', '<gv', opts)

-- Moving lines
keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)

keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)

keymap.set('i', '<A-Up>', '<Esc>:MoveLine(-1)<CR>gi', opts)
keymap.set('i', '<A-Down>', '<Esc>:MoveLine(1)<CR>gi', opts)

-- Delete current buffer
api.nvim_set_keymap('n', '<A-q>', ':bd<CR>', opts)
api.nvim_set_keymap('i', '<A-q>', '<Esc>:bd<CR>:startinsert<CR>', opts)
api.nvim_set_keymap('v', '<A-q>', '<Esc>:bd<CR>', opts)

-- Split the window
api.nvim_set_keymap('n', '<C-A-Tab>', ':vsplit<CR>', opts)

-- Move the current split window up
api.nvim_set_keymap('n', '<C-A-D-Up>', '<C-w>K', opts)
api.nvim_set_keymap('i', '<C-A-D-Up>', '<Esc><C-w>K', opts)
api.nvim_set_keymap('v', '<C-A-D-Up>', '<Esc><C-w>K', opts)

-- Move the current split window down 
api.nvim_set_keymap('n', '<C-A-D-Down>', '<C-w>J', opts)
api.nvim_set_keymap('i', '<C-A-D-Down>', '<Esc><C-w>J', opts)
api.nvim_set_keymap('v', '<C-A-D-Down>', '<Esc><C-w>J', opts)

-- Move the current split window to the left side
api.nvim_set_keymap('n', '<C-A-D-Left>', '<C-w>H', opts)
api.nvim_set_keymap('i', '<C-A-D-Left>', '<Esc><C-w>H', opts)
api.nvim_set_keymap('v', '<C-A-D-Left>', '<Esc><C-w>H', opts)

-- Move the current split window to the right side
api.nvim_set_keymap('n', '<C-A-D-Right>', '<C-w>L', opts)
api.nvim_set_keymap('i', '<C-A-D-Right>', '<Esc><C-w>L', opts)
api.nvim_set_keymap('v', '<C-A-D-Right>', '<Esc><C-w>L', opts)

-- Moving between buffers in the current split window
api.nvim_set_keymap('n', '<M-Left>', '<Cmd>bprev<CR>', opts)
api.nvim_set_keymap('n', '<M-Right>', '<Cmd>bnext<CR>', opts)

-- Deleting the entire word using CTRL + Backspace
api.nvim_set_keymap('n', '<C-BS>', 'daw', opts)
api.nvim_set_keymap('i', '<C-BS>', '<C-W>', opts)
api.nvim_set_keymap('v', '<C-BS>', 'daw', opts)

-- Alt + / = exit
api.nvim_set_keymap('n', '<M-\\>', ':q!<CR>', opts)
api.nvim_set_keymap('i', '<M-\\>', '<Esc>:q!<CR>', opts)

-- NeoTree
keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Lspsaga
api.nvim_set_keymap('n', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)
api.nvim_set_keymap('i', '<F12>', '<cmd>Lspsaga goto_definition<CR>', opts)

api.nvim_set_keymap('n', '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
api.nvim_set_keymap('i', '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
api.nvim_set_keymap('i', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

api.nvim_set_keymap('n', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)
api.nvim_set_keymap('i', '<A-1>', '<cmd>Lspsaga code_action<CR>', opts)

keymap.set("n", "<C-r>", "<cmd>Lspsaga rename<CR>", opts, { desc = "[C]ode [R]ename" })
keymap.set("i", "<C-r>", "<cmd>Lspsaga rename<CR>", opts, { desc = "[C]ode [R]ename" })

-- Telescope
local builtin = require('telescope.builtin')

keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>fw', builtin.live_grep)
keymap.set('n', '<leader>fb', builtin.buffers)
keymap.set('n', '<leader>fh', builtin.help_tags)
keymap.set('n', '<leader>gb', builtin.git_branches)
keymap.set('n', '<leader>gc', builtin.git_commits)
keymap.set('n', '<leader>gs', builtin.git_status)
keymap.set('n', '<leader>ls', builtin.lsp_document_symbols)
keymap.set('n', 'gr', builtin.lsp_references, opts )
keymap.set('n', 'gd', builtin.lsp_definitions, opts )
