return {
  "alexpasmantier/pymple.nvim",
  ft = "python",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  build = ":PympleBuild",
  config = function()
    require("pymple").setup({
      update_imports = {
        filetypes = { "python", "markdown" }
      },
      add_import_to_buf = {
        autosave = true
      },
      python = {
        root_markers = { "pyproject.toml", "setup.py", "main.py" },
        virtual_env_names = { ".venv" },
      }
    })
  end
}
