return {
  'echasnovski/mini.nvim',
  version = false,
  event = "VeryLazy",
  config = function()
    require('mini.pairs').setup()
    require('mini.move').setup()
  end
}
