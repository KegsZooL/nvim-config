return {
  'akinsho/bufferline.nvim',
  version = "*",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup {
      options = {
        separator_style = { "", "" },
      }
    }
  end
}
