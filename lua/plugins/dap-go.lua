local util = require('lspconfig.util')

local root_dir = util.root_pattern(".git")(vim.fn.getcwd()) or vim.fn.getcwd()

require('dap-go').setup({
  dap_configurations = {
    {
      type = "go",
      name = "Debug Package (root .git)",
      request = "launch",
      program = root_dir,  -- запускать именно из корня проекта (где .git)
    },
  },
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
    build_flags = {},
    detached = vim.fn.has("win32") == 0,
    cwd = root_dir,  -- важная строка — рабочая директория для dlv
  },
  tests = {
    verbose = false,
  },
})

