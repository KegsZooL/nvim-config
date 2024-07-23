local nvim_notify = require("notify")
nvim_notify.setup {
  -- Animation style
  stages = "fade",
  -- Default timeout for notifications
  timeout = 1500,
  background_colour = "#2E3440",
  render = "compact"
}

vim.notify = nvim_notify
