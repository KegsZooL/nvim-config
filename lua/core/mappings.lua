-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')


vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
-- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })

--
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F12>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

--
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

--
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set("v", "<C-r>", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set("i", "<C-r>", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })

-- CTRL+Z
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>:undo<CR>', { noremap = true, silent = true })

-- CTRL+SHIFT+Z
vim.api.nvim_set_keymap('n', '<C-S-z>', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-z>', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S-z>', '<C-o>:redo<CR>', { noremap = true, silent = true })

-- CTRL + L
vim.api.nvim_set_keymap('n', '<C-l>', 'dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-l>', 'dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>:normal! dd<CR>a', { noremap = true, silent = true })

-- CTRL + D
vim.api.nvim_set_keymap('n', '<C-d>', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-d>', 'yyp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>:call append(line("."), getline("."))<CR>a', { noremap = true, silent = true })

-- CTRL + Left
vim.api.nvim_set_keymap('n', '<C-Left>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Left>', 'b', { noremap = true, silent = true })

-- CTRL + Right
vim.api.nvim_set_keymap('n', '<C-Right>', 'e', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Right>', 'e', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Left>', '<C-o>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-Right>', '<C-o>e', { noremap = true, silent = true })

-- CTRL + Up
vim.api.nvim_set_keymap('n', '<C-Up>', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Up>', 'k', { noremap = true, silent = true })

-- CTRL + Down
vim.api.nvim_set_keymap('n', '<C-Down>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-Down>', 'j', { noremap = true, silent = true })

-- CTRL + /
vim.api.nvim_set_keymap('n', '<C-/>', ':lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-/>', ':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })

-- Ctrl+S 
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S>', '<Esc>:w<CR>a', { noremap = true, silent = true })

-- Shift + Up
vim.api.nvim_set_keymap('n', '<S-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Shift + Down
vim.api.nvim_set_keymap('n', '<S-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Insert
vim.api.nvim_set_keymap('n', 'ш', 'i', { noremap = true })
vim.api.nvim_set_keymap('n', 'Ш', 'i', { noremap = true })
vim.api.nvim_set_keymap('v', 'ш', 'i', { noremap = true })
vim.api.nvim_set_keymap('v', 'Ш', 'i', { noremap = true })

-- Visual
vim.api.nvim_set_keymap('i', 'м', 'v', { noremap = true })
vim.api.nvim_set_keymap('i', 'М', 'v', { noremap = true })
vim.api.nvim_set_keymap('n', 'м', 'v', { noremap = true })
vim.api.nvim_set_keymap('n', 'М', 'v', { noremap = true })

-- Настройка выделения текста с помощью Shift+стрелочки в нормальном режиме
vim.api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', { noremap = true, silent = true })

-- Настройка выделения текста с помощью Shift+стрелочки в визуальном режиме
vim.api.nvim_set_keymap('v', '<S-Left>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '<Down>', { noremap = true, silent = true })

-- Настройка выделения текста с помощью Shift+стрелок в insert mode
vim.api.nvim_set_keymap('i', '<S-Left>', '<Esc>v<Left>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>v<Right>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Up>', '<Esc>v<Up>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>v<Down>a', { noremap = true, silent = true })

-- Mapping для выделения слова целиком в insert mode
vim.api.nvim_set_keymap('i', '<S-C-Left>', '<Esc>:normal! vwb<CR>a', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<S-C-Right>', '<Esc>:normal! vwe<CR>a', { silent = true, noremap = true })

-- Copy/Paste
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find Files" })
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

vim.api.nvim_set_keymap('n', '<BS>', 'i<BS>', {noremap = true})

-- Настройка маппинга для перехода в insert mode при нажатии Enter
vim.api.nvim_set_keymap('n', '<CR>', 'i<CR>', { noremap = true, silent = true })

-- Настройка обратного табулятора на Shift+Tab в insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })

-- Настройка Tab для перехода в insert mode и вставки табуляции
vim.api.nvim_set_keymap('n', '<Tab>', ':startinsert<CR><Tab>', { noremap = true, silent = true })

-- Настройка Shift+Tab для перехода в insert mode и вставки табуляции
vim.api.nvim_set_keymap('n', '<S-Tab>', ':startinsert<CR><C-d>', { noremap = true, silent = true })

local function split_window()
    vim.cmd('vsplit') 
    vim.cmd('wincmd l')
end

-- Split window
vim.api.nvim_set_keymap('n', '<C-A-Tab>', ':vsplit<CR>', { noremap = true, silent = true })

-- Настройка комбинации клавиш Ctrl+Alt+Q для выхода из Vim
vim.api.nvim_set_keymap('n', '<M-\\>', ':q!<CR>', { noremap = true, silent = true })

-- Настройка комбинаций клавиш для изменения фокуса split-окон
vim.api.nvim_set_keymap('n', '<C-A-Up>', '<Cmd>wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-A-Down>', '<Cmd>wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-A-Left>', '<Cmd>wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-A-Right>', '<Cmd>wincmd l<CR>', { silent = true })

-- Настройка комбинаций клавиш для переключения между буферами в текущем split-окне
vim.api.nvim_set_keymap('n', '<M-Left>', '<Cmd>bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Right>', '<Cmd>bnext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<BS>', '<Del>', { noremap = true })

-- Привязка клавиши Tab для добавления отступа на 4 пробела в выделенном режиме
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })

-- Привязка клавиши Shift-Tab для удаления отступа на 4 пробела в выделенном режиме
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })


local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)

-- Insert-mode commands
vim.keymap.set('i', '<A-Up>', '<Esc>:MoveLine(-1)<CR>gi', opts)
vim.keymap.set('i', '<A-Down>', '<Esc>:MoveLine(1)<CR>gi', opts)


-- Нормальный режим
vim.api.nvim_set_keymap('n', '<A-q>', ':bd<CR>', opts)

-- Режим вставки
vim.api.nvim_set_keymap('i', '<A-q>', '<Esc>:bd<CR>:startinsert<CR>', opts)

-- Визуальный режим
vim.api.nvim_set_keymap('v', '<A-q>', '<Esc>:bd<CR>', opts)

-- Переместить текущий сплит вверх
vim.api.nvim_set_keymap('n', '<C-A-D-Up>', '<C-w>K', opts)
vim.api.nvim_set_keymap('i', '<C-A-D-Up>', '<Esc><C-w>K', opts)
vim.api.nvim_set_keymap('v', '<C-A-D-Up>', '<Esc><C-w>K', opts)

-- Переместить текущий сплит вниз
vim.api.nvim_set_keymap('n', '<C-A-D-Down>', '<C-w>J', opts)
vim.api.nvim_set_keymap('i', '<C-A-D-Down>', '<Esc><C-w>J', opts)
vim.api.nvim_set_keymap('v', '<C-A-D-Down>', '<Esc><C-w>J', opts)

-- Переместить текущий сплит влево
vim.api.nvim_set_keymap('n', '<C-A-D-Left>', '<C-w>H', opts)
vim.api.nvim_set_keymap('i', '<C-A-D-Left>', '<Esc><C-w>H', opts)
vim.api.nvim_set_keymap('v', '<C-A-D-Left>', '<Esc><C-w>H', opts)

-- Переместить текущий сплит вправо
vim.api.nvim_set_keymap('n', '<C-A-D-Right>', '<C-w>L', opts)
vim.api.nvim_set_keymap('i', '<C-A-D-Right>', '<Esc><C-w>L', opts)
vim.api.nvim_set_keymap('v', '<C-A-D-Right>', '<Esc><C-w>L', opts)
 
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', {noremap = true})
