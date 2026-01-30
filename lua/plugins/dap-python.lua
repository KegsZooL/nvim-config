return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  config = function()
    local python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(python_path)
  end
}
