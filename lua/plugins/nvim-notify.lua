local nvim_notify = require("notify")
local log = vim.log

nvim_notify.setup {
  stages = "fade",
  timeout = 1500,
  background_colour = "#2E3440",
  render = "compact",
  levels = {
    ["ERROR"] = log.levels.ERROR,
    ["WARN"] = log.levels.WARN,
    ["INFO"] = log.levels.INFO,
    ["DEBUG"] = log.levels.DEBUG,
    ["TRACE"] = log.levels.TRACE,
  }
}
vim.notify = nvim_notify
