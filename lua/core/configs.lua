vim.wo.number = true
vim.g.formatoptions = "qn1"
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.signcolumn = "yes" 
vim.opt.updatetime = 300
vim.opt.undofile = true
vim.opt.title = false 
vim.opt.shell = "/bin/zsh"
vim.opt.fileformat = "unix"
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.colorcolumn = "99999"       -- fixes visual bugs
vim.opt.clipboard = "unnamedplus"   -- allows neovim to access the system clipboard
vim.opt.conceallevel = 0            -- disables hiding. All characters are displayed as is

vim.opt.completeopt = { "menuone", "noselect" } 
-- menuone - shows the auto-completion menu even if there is only one option
-- noselect- does't automatically select the first item in the autocomplete menu

vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true               -- option allows you to switch buffers without needing to write changes to the file
vim.opt.termguicolors = true        -- set term gui colors

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false         -- prevent you from editing a file that is 
                                    -- already in use by another app
-- Indent Settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.breakindent = true
vim.opt.expandtab = true            -- convert tabs to spaces
vim.opt.smartindent = true          -- make indenting smarter

-- Mouse
vim.opt.mouse = "a"                 -- enable mouse support
vim.opt.mousefocus = true
vim.opt.cursorline = true           -- highlight current line

--Scroll
vim.opt.so = 30                     -- the cursor will always be centered
vim.opt.scrolloff = 8               -- minimal number of lines for scrolling

-- Splits
vim.opt.splitbelow = true           -- force all horizontal splits to go below current window
vim.opt.splitright = true           -- force all vertical splits to go to the right of current window

-- Searching Behaviors
vim.opt.ignorecase = true           -- ignore case in search
vim.opt.hlsearch = true             -- highlight all matches in search
vim.opt.smartcase = true            -- smart case

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ",
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])
