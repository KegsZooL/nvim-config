require("pymple").setup(
  {
    update_imports = {
      filetypes = { "python", "markdown" }
    },
    add_import_to_buf = {
      autosave = true
    },
    python = {
      root_markers = { "pyproject.toml", "setup.py", ".git", "main.py" },
      virtual_env_names = { ".venv", }
    }
  }
)

