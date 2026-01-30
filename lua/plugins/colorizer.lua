return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require('colorizer').setup(
      {
        '*',
        'css',
        'lua',
        html = { mode = 'background' },
      },
      { mode = 'background' })
  end
}
