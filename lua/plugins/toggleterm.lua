return {
  'akinsho/toggleterm.nvim',
  version = "*",
  cmd = "ToggleTerm",
  config = function()
    require("toggleterm").setup{
      size = 15,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      autochdir = true,
      shading_factor = 1,
      persist_size = true,
      shade_terminal = true,
      shell = vim.o.shell,
      shade_filetypes = {},
      direction = "float",
      float_opts = {
        border = "double",
      },
    }
  end
}
