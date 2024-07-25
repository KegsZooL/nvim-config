local cmd = vim.cmd
local api = vim.api

vim.o.background = "dark" -- or "light" for light mode
cmd("let g:gruvbox_material_background= 'medium'")
cmd("let g:gruvbox_material_transparent_background=1")
cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
cmd("let g:gruvbox_material_enable_bold=1")
cmd("let g:gruvbox_material_enable_italic=1")
cmd([[colorscheme gruvbox-material]]) -- Set color scheme

-- changing bg and border colors
api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

