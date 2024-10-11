local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local wo = vim.wo
local fn = vim.fn
local api = vim.api

wo.relativenumber = true
wo.number = true
g.formatoptions = "qn1"
opt.backspace = "indent,eol,start"
opt.wrap = false
opt.showmode = false
opt.updatetime = 50
opt.undofile = true
opt.title = false
opt.shortmess:append("c")
opt.virtualedit = "block"
opt.shell = "/bin/zsh"
opt.whichwrap = "<,>,[,],b,s,h,l"
opt.autoindent = true
opt.undodir = fn.stdpath "cache" .. "/undo"
opt.autochdir = false
opt.signcolumn = "yes"
opt.conceallevel = 0            -- disables hiding. All characters are displayed as is
opt.colorcolumn = "99999"       -- fixes visual bugs
opt.clipboard = "unnamedplus"   -- allows neovim to access the system clipboard

opt.completeopt = { "menuone", "noselect" }
                                -- menuone - shows the auto-completion menu even if there is only one option
                                -- noselect- does't automatically select the first item in the autocomplete menu

opt.fileencoding = "utf-8"
opt.hidden = true               -- option allows you to switch buffers without needing to write changes to the file
opt.termguicolors = true        -- set term gui colors

-- Backups
opt.swapfile = false
opt.backup = false
opt.writebackup = false         -- prevent you from editing a file that is 
                                -- already in use by another app
-- Indent Settings
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.breakindent = true
opt.expandtab = true            -- convert tabs to spaces
opt.smartindent = true          -- make indenting smarter

-- Appearance
opt.pumheight = 10
opt.cmdheight = 0
opt.laststatus = 3
opt.showtabline = 0

-- Mouse & cursor
opt.mouse = "a"                 -- enable mouse support
opt.mousefocus = true
opt.cursorline = false          -- highlight current line
opt.cursorcolumn = false

--Scroll
opt.so = 30                     -- the cursor will always be centered
opt.scrolloff = 8               -- minimal number of lines for scrolling
opt.sidescrolloff = 5

-- Splits
opt.splitbelow = true           -- force all horizontal splits to go below current window
opt.splitright = true           -- force all vertical splits to go to the right of current window
opt.inccommand = "split"

-- Searching Behaviors
opt.ignorecase = true           -- ignore case in search
opt.hlsearch = true             -- highlight all matches in search
opt.smartcase = true            -- smart case

-- Fillchars
opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ",
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

cmd([[highlight clear LineNr]])
cmd([[highlight clear SignColumn]])
cmd("let g:netrw_liststyle = 3")
cmd("filetype plugin indent on")
cmd([[highlight WinSeparator guibg = None]])

-- keep cursor unchanged after quiting
api.nvim_create_autocmd("ExitPre", {
	group = api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim.",
})

-- disalbe commenting next line
api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- Automatic disabling of text highlight after search
api.nvim_create_autocmd('CursorMoved', {
  group = api.nvim_create_augroup('auto-hlsearch', { clear = true }),
  callback = function ()
    if vim.v.hlsearch == 1 and fn.searchcount().exact_match == 0 then
      vim.schedule(function () cmd.nohlsearch() end)
    end
  end
})
