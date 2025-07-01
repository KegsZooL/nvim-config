local nvim_notify = require("notify")
local log = vim.log

nvim_notify.setup {
  background_colour = "#2E3440",
  levels = {
    ["ERROR"] = log.levels.ERROR,
    ["WARN"] = log.levels.WARN,
    ["INFO"] = log.levels.INFO,
    ["DEBUG"] = log.levels.DEBUG,
    ["TRACE"] = log.levels.TRACE,
  }
}
vim.notify = function(msg, level, opts)
  level = level or log.levels.INFO
  if level == log.levels.INFO then
    return
  end
  nvim_notify(msg, level, opts)
end
