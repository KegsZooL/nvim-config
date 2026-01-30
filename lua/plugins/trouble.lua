return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "LspAttach",
  config = function()
    require("trouble").setup({
      modes = {
        diagnostics = {
          filter = { buf = 0 }, -- only current buffer
        },
      },
    })
  end
}
