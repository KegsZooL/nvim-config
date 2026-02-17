return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local fn = vim.fn

    dapui.setup({
      layouts = { {
        elements = { {
          id = "scopes",
          size = 0.8
        }, {
          id = "breakpoints",
          size = 0.1
        }, {
          id = "stacks",
          size = 0.1
        }, {
          id = "watches",
          size = 0.1
        } },
        position = "left",
        size = 100
      }, {
        elements = { {
          id = "repl",
          size = 0.5
        }, {
          id = "console",
          size = 0.5
        } },
        position = "bottom",
        size = 10
      } },
      mappings = {
        edit = "<leader>nk",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
    })

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

    local get_args = function()
      local cmd_args = vim.fn.input('CommandLine Args:')
      local params = {}
      for param in string.gmatch(cmd_args, "[^%s]+") do
        table.insert(params, param)
      end
      return params
    end

    -- Resolve python from project venv, fallback to global python3
    local get_python = function()
      local cwd = vim.fn.getcwd()
      local venv_names = { ".venv", "venv", ".env" }
      for _, name in ipairs(venv_names) do
        local python = cwd .. "/" .. name .. "/bin/python"
        if vim.fn.executable(python) == 1 then
          return python
        end
      end
      return vim.fn.exepath("python3")
    end

    dap.configurations.python = {
      {
        name = "File | justMyCode = false",
        type = "python",
        request = "launch",
        program = '${file}',
        pythonPath = get_python,
        justMyCode = false,
      },
      {
        name = "File:args | justMyCode = false",
        type = "python",
        request = "launch",
        program = '${file}',
        pythonPath = get_python,
        args = get_args,
        justMyCode = false,
      },
      {
        name = "FastAPI (uvicorn)",
        type = "debugpy",
        request = "launch",
        module = "uvicorn",
        pythonPath = get_python,
        args = function ()
          return {
            vim.fn.input("Enter app path (e.g., src.main:app)", "src.backend.app.main:app"),
            "--reload"
          }
        end,
        justMyCode = false,
        jinja = true
      },
    }
  end
}
