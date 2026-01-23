local ok, dap_python = pcall(require, "dap-python")
if not ok then return end

local python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
dap_python.setup(python_path)
