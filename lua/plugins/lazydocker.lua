return {
  "crnvl96/lazydocker.nvim",
  cmd = "Lazydocker",
  config = function()
    require('lazydocker').setup({
      window = {
        settings = {
          width = 0.85,
          height = 0.85,
          border = 'rounded',
          relative = 'editor',
        },
      },
    })
  end
}
