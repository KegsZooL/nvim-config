local keymap = vim.keymap
local api = vim.api
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

-- NeoTree
keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

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

-- CTRL+Z
api.nvim_set_keymap('n', '<C-z>', 'u', opts)
api.nvim_set_keymap('v', '<C-z>', 'u', opts)
api.nvim_set_keymap('i', '<C-z>', '<C-o>:undo<CR>', opts)

-- CTRL+SHIFT+Z
api.nvim_set_keymap('n', '<C-S-z>', '<C-r>', opts)
api.nvim_set_keymap('v', '<C-S-z>', '<C-r>', opts)
api.nvim_set_keymap('i', '<C-S-z>', '<C-o>:redo<CR>', opts)

-- CTRL + L
api.nvim_set_keymap('n', '<C-l>', 'dd', opts)
api.nvim_set_keymap('v', '<C-l>', 'dd', opts)
api.nvim_set_keymap('i', '<C-l>', '<Esc>:normal! dd<CR>a', opts)

-- CTRL + D
api.nvim_set_keymap('n', '<C-d>', 'yyp', opts)
api.nvim_set_keymap('v', '<C-d>', 'yyp', opts)
api.nvim_set_keymap('i', '<C-d>', '<Esc>:call append(line("."), getline("."))<CR>a', opts)

-- CTRL + Left
api.nvim_set_keymap('n', '<C-Left>', 'b', opts)
api.nvim_set_keymap('v', '<C-Left>', 'b', opts)
api.nvim_set_keymap('i', '<C-Left>', '<C-o>b', opts)

-- CTRL + Right
api.nvim_set_keymap('n', '<C-Right>', 'w', opts)
api.nvim_set_keymap('v', '<C-Right>', 'w', opts)
api.nvim_set_keymap('i', '<C-Right>', '<C-o>w', opts)

-- CTRL + Up
api.nvim_set_keymap('n', '<C-Up>', 'k', opts)
api.nvim_set_keymap('v', '<C-Up>', 'k', opts)

-- CTRL + Down
api.nvim_set_keymap('n', '<C-Down>', 'j', opts)
api.nvim_set_keymap('v', '<C-Down>', 'j', opts)

-- CTRL + /
api.nvim_set_keymap('n', '<C-/>', ':lua require("Comment.api").toggle.linewise.current()<CR>', opts)
api.nvim_set_keymap('v', '<C-/>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Ctrl+S 
api.nvim_set_keymap('n', '<C-S>', ':w<CR>', opts)
api.nvim_set_keymap('v', '<C-S>', ':w<CR>', opts)
api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>a', opts)

-- Shift + Up
api.nvim_set_keymap('n', '<S-Up>', ':m .-2<CR>==', opts)
api.nvim_set_keymap('v', '<S-Up>', ':m .-2<CR>==', opts)

-- Shift + Down
api.nvim_set_keymap('n', '<S-Down>', ':m .+1<CR>==', opts)
api.nvim_set_keymap('v', '<S-Down>', ':m .+1<CR>==', opts)

-- Insert
api.nvim_set_keymap('n', 'ш', 'i', { noremap = true })
api.nvim_set_keymap('n', 'Ш', 'i', { noremap = true })
api.nvim_set_keymap('v', 'ш', 'i', { noremap = true })
api.nvim_set_keymap('v', 'Ш', 'i', { noremap = true })

-- Visual
api.nvim_set_keymap('i', 'м', 'v', { noremap = true })
api.nvim_set_keymap('i', 'М', 'v', { noremap = true })
api.nvim_set_keymap('n', 'м', 'v', { noremap = true })
api.nvim_set_keymap('n', 'М', 'v', { noremap = true })

-- Настройка выделения текста с помощью Shift+стрелочки в нормальном режиме
api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', opts)
api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', opts)
api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', opts)
api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', opts)

-- Настройка выделения текста с помощью Shift+стрелочки в визуальном режиме
api.nvim_set_keymap('v', '<S-Left>', '<Left>', opts)
api.nvim_set_keymap('v', '<S-Right>', '<Right>', opts)
api.nvim_set_keymap('v', '<S-Up>', '<Up>', opts)
api.nvim_set_keymap('v', '<S-Down>', '<Down>', opts)

-- Настройка выделения текста с помощью Shift+стрелок в insert mode
api.nvim_set_keymap('i', '<S-Left>', '<Esc>v<Left>a', opts)
api.nvim_set_keymap('i', '<S-Right>', '<Esc>v<Right>a', opts)
api.nvim_set_keymap('i', '<S-Up>', '<Esc>v<Up>a', opts)
api.nvim_set_keymap('i', '<S-Down>', '<Esc>v<Down>a', opts)

-- Mapping для выделения слова целиком в insert mode
api.nvim_set_keymap('i', '<S-C-Left>', '<Esc>:normal! vwb<CR>a', opts)
api.nvim_set_keymap('i', '<S-C-Right>', '<Esc>:normal! vwe<CR>a', opts)

-- Copy/Paste
api.nvim_set_keymap('n', '<C-c>', '"+y', opts)
api.nvim_set_keymap('v', '<C-c>', '"+y', opts)
api.nvim_set_keymap('n', '<C-v>', '"+p', opts)
api.nvim_set_keymap('v', '<C-v>', '"+p', opts)
api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', opts)

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

api.nvim_set_keymap('n', '<BS>', 'i<BS>', {noremap = true})

-- Настройка маппинга для перехода в insert mode при нажатии Enter
api.nvim_set_keymap('n', '<CR>', 'i<CR>', opts)

-- Настройка обратного табулятора на Shift+Tab в insert mode
api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', opts)

-- Настройка Tab для перехода в insert mode и вставки табуляции
api.nvim_set_keymap('n', '<Tab>', ':startinsert<CR><Tab>', opts)

-- Настройка Shift+Tab для перехода в insert mode и вставки табуляции
api.nvim_set_keymap('n', '<S-Tab>', ':startinsert<CR><C-d>', opts)

-- Split window
api.nvim_set_keymap('n', '<C-A-Tab>', ':vsplit<CR>', opts)

-- Настройка комбинации клавиш Ctrl+Alt+Q для выхода из Vim
api.nvim_set_keymap('n', '<M-\\>', ':q!<CR>', opts)

-- Настройка комбинаций клавиш для изменения фокуса split-окон
api.nvim_set_keymap('n', '<C-A-Up>', '<Cmd>wincmd k<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Down>', '<Cmd>wincmd j<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Left>', '<Cmd>wincmd h<CR>', { silent = true })
api.nvim_set_keymap('n', '<C-A-Right>', '<Cmd>wincmd l<CR>', { silent = true })

-- Настройка комбинаций клавиш для переключения между буферами в текущем split-окне
api.nvim_set_keymap('n', '<M-Left>', '<Cmd>bprev<CR>', opts)
api.nvim_set_keymap('n', '<M-Right>', '<Cmd>bnext<CR>', opts)

api.nvim_set_keymap('n', '<BS>', '<Del>', opts)

-- Привязка клавиши Tab для добавления отступа на 4 пробела в выделенном режиме
api.nvim_set_keymap('v', '<Tab>', '>gv', opts)

-- Привязка клавиши Shift-Tab для удаления отступа на 4 пробела в выделенном режиме
api.nvim_set_keymap('v', '<S-Tab>', '<gv', opts)

-- Normal-mode commands

keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)

-- Visual-mode commands
keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)

-- Insert-mode commands
keymap.set('i', '<A-Up>', '<Esc>:MoveLine(-1)<CR>gi', opts)
keymap.set('i', '<A-Down>', '<Esc>:MoveLine(1)<CR>gi', opts)

-- Нормальный режим
api.nvim_set_keymap('n', '<A-q>', ':bd<CR>', opts)

-- Режим вставки
api.nvim_set_keymap('i', '<A-q>', '<Esc>:bd<CR>:startinsert<CR>', opts)

-- Визуальный режим
api.nvim_set_keymap('v', '<A-q>', '<Esc>:bd<CR>', opts)

-- Переместить текущий сплит вверх
api.nvim_set_keymap('n', '<C-A-D-Up>', '<C-w>K', opts)
api.nvim_set_keymap('i', '<C-A-D-Up>', '<Esc><C-w>K', opts)
api.nvim_set_keymap('v', '<C-A-D-Up>', '<Esc><C-w>K', opts)

-- Переместить текущий сплит вниз
api.nvim_set_keymap('n', '<C-A-D-Down>', '<C-w>J', opts)
api.nvim_set_keymap('i', '<C-A-D-Down>', '<Esc><C-w>J', opts)
api.nvim_set_keymap('v', '<C-A-D-Down>', '<Esc><C-w>J', opts)

-- Переместить текущий сплит влево
api.nvim_set_keymap('n', '<C-A-D-Left>', '<C-w>H', opts)
api.nvim_set_keymap('i', '<C-A-D-Left>', '<Esc><C-w>H', opts)
api.nvim_set_keymap('v', '<C-A-D-Left>', '<Esc><C-w>H', opts)

-- Переместить текущий сплит вправо
api.nvim_set_keymap('n', '<C-A-D-Right>', '<C-w>L', opts)
api.nvim_set_keymap('i', '<C-A-D-Right>', '<Esc><C-w>L', opts)
api.nvim_set_keymap('v', '<C-A-D-Right>', '<Esc><C-w>L', opts)

api.nvim_set_keymap('i', '<C-BS>', '<C-W>', { noremap = true })
