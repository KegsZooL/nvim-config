return {
  "0xfraso/nvim-listchars",
  event = "VeryLazy",
  config = function()
    require("nvim-listchars").setup({
      save_state = true,
      listchars = {
        tab = "→\\",
        trail = "·",
        space = "·",
        nbsp = "↔",
        eol = "$"
      },
      notifications = false,
      exclude_filetypes = {},
      lighten_step = 5,
    })
  end
}
