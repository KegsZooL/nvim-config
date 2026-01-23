local ok, dap_go = pcall(require, 'dap-go')
if not ok then return end

local util = require('lspconfig.util')
local root_dir = util.root_pattern(".git")(vim.fn.getcwd()) or vim.fn.getcwd()

dap_go.setup({
  dap_configurations = {
    {
      type = "go",
      name = "Debug Package (root .git)",
      request = "launch",
      program = root_dir,
    },
  },
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
    build_flags = {},
    detached = vim.fn.has("win32") == 0,
  },
  tests = {
    verbose = false,
  },
})

