local dap = require("dap")
local dapui = require("dapui")
local fn = vim.fn

dapui.setup()

-- Automatically open/close DAP UI
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function() dapui.close()
end

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },

})

require("nvim-dap-virtual-text").setup({
    commented = true,
})

fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

fn.sign_define("DapStopped", {
    text = "",
    texthl = "DiagnosticSignWarn",
    linehl = "Visual",
    numhl = "DiagnosticSignWarn",
})

dap.configurations.python = {
  {
    name = "FastAPI (uvicorn)",
    type = "debugpy",
    request = "launch",
    module = "uvicorn",
    pythonPath = "python",
    args = {
        "salt_box_core.main:app", -- source to main.py
    },
    justMyCode = false,
    jinja = true
  },
}
