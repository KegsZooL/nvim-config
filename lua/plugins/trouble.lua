local ok, trouble = pcall(require, "trouble")
if not ok then return end

trouble.setup({
  modes = {
    diagnostics = {
      filter = { buf = 0 }, -- only current buffer
    },
  },
})
