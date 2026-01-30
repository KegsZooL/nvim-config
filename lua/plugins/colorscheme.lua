return {
  'savq/melange-nvim',
  priority = 1000,
  config = function()
    local cmd = vim.cmd
    local api = vim.api

    vim.o.background = "dark"

    cmd([[colorscheme melange]])

    api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#e78a4e", bold = true })

    -- Highlight groups for indent-blankline
    api.nvim_set_hl(0, "IblScope", { fg = "#7daea3" })
    api.nvim_set_hl(0, "IblIndent", { fg = "#3c3836" })
  end
}
