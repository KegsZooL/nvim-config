return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      delay = 500,
      icons = {
        rules = false,
        separator = "➜",
        group = "",
      },
      show_keys = false,
      show_help = false,
      align = "center",
      layout = {},
      win = {
        border = "double",
        title = false,
        padding = { 1, 1 },
        no_overlap = true,
      },
      wk.add({
        { "<leader>f", group = "Telescope" },
        { "<leader>l", group = "LSP" },
        { "<leader>o", group = "Options Commands" },
        { "<leader>g", group = "Gitsigns" },
      }),
    })
  end
}
