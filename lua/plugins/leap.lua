return {
  url = "https://codeberg.org/andyg/leap.nvim",
  event = "VeryLazy",
  config = function()
    local leap = require('leap')
    leap.opts.vim_opts['go.ignorecase'] = false
  end
}
