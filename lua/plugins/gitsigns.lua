return {
  'lewis6991/gitsigns.nvim',
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = 'eol',
      },
      numhl = true,
      max_file_length = 10000,
      update_debounce = 200,
    })
  end
}
