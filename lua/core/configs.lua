vim.wo.number = true
vim.opt.wrap = false
vim.opt.showmode = false -- hide mode display
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.swapfile = false -- creates a swapfile
vim.opt.backup = false -- creates a backup file
vim.opt.updatetime = 300 -- faster completion
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.title = true -- set the title of window 
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes visual bugs
vim.opt.conceallevel = 0 -- disables hiding. All characters are displayed as is

vim.opt.completeopt = { "menuone", "noselect" } 
-- menuone - shows the auto-completion menu even if there is only one option
-- noselect- does't automatically select the first item in the autocomplete menu

vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- set the folding method for treesutter to "manual"
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.hidden = true -- option allows you to switch buffers without needing to write changes to the file
vim.opt.termguicolors = true -- set term gui colors
vim.opt.timeoutlen = 1000 -- improve the response your mapping (the time in milliseconds after which the mapping input will end)
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program)
                            -- it is not allowed to be edited
-- Indent Settings
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- make indenting smarter
vim.opt.breakindent = true

-- Mouse
vim.opt.mouse = "a" -- enable mouse support
vim.opt.mousefocus = true
vim.opt.cursorline = true -- highlight current line

-- Splits
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

-- Searching Behaviors
vim.opt.hlsearch = true -- highlight all matches in search
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- smart case

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])