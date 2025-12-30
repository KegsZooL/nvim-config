require("trouble").setup({
  modes = {
    diagnostics = {
      filter = { buf = 0 }, -- only current buffer
    },
  },
})
