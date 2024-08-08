local dap = require("dap")
local dapui = require("dapui")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

keymap.set('n', '<A-p>', dap.toggle_breakpoint, opts)
keymap.set('n', '<F11>', dap.step_over, opts)
keymap.set('n', '<F1>', dap.step_into, opts)
