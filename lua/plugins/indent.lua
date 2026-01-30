return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  dependencies = { 'savq/melange-nvim' },
  opts = {
    indent = {
        char = "│",
        tab_char = "│",
    },
    scope = {
        enabled = false,
    },
  }
}
