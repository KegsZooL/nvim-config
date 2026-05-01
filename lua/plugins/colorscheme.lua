return {
  -- 'savq/melange-nvim',
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    local cmd = vim.cmd
    local api = vim.api

    vim.o.background = "dark"

    -- cmd([[colorscheme melange]])
    -- Highlight groups for indent-blankline
    -- api.nvim_set_hl(0, "IblScope", { fg = "#7daea3" })
    -- api.nvim_set_hl(0, "IblIndent", { fg = "#3c3836" })

    cmd("let g:gruvbox_material_background= 'medium'")
    cmd("let g:gruvbox_material_transparent_background=1")
    cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
    cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
    cmd("let g:gruvbox_material_enable_bold=1")
    cmd("let g:gruvbox_material_enable_italic=1")

    cmd([[colorscheme gruvbox-material]])

    api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#e78a4e", bold = true })

  end
}
