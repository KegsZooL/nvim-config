-- -- Set up environment BEFORE loading plugins
-- local function setup_env()
--   -- Add cargo bin to PATH (for gg used by pymple)
--   local cargo_bin = vim.fn.expand("~/.cargo/bin")
--   if vim.fn.isdirectory(cargo_bin) == 1 then
--     vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
--   end
--
--   -- Set up Python venv
--   local cwd = vim.fn.getcwd()
--   local venv_path = cwd .. "/.venv"
--
--   if vim.fn.isdirectory(venv_path) == 1 then
--     vim.env.VIRTUAL_ENV = venv_path
--     vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
--   end
-- end
-- setup_env()

-- Basic config
require("core.lazy")
require("core.configs")
require("core.mappings")

-- Plugins setting
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.mason")
require("plugins.mason-nvim-dap")
require("plugins.lspconfig")
require("plugins.null-ls")
require("plugins.lspsaga")
require("plugins.cmp")
require("plugins.dap")
require("plugins.dap-go")
require("plugins.dap-python")
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.toggleterm")
require("plugins.move")
require("plugins.dashboard")
require("plugins.comment")
require("plugins.nvim-notify")
require("plugins.indent")
require("plugins.gitsigns")
require("plugins.which-key")
require("plugins.trouble")
require("plugins.surround")
require("plugins.emoji")
require("plugins.nerdy")
require("plugins.web-tools")
require("plugins.colortils")
require("plugins.illuminate")
require("plugins.autotag")
require("plugins.noice")
require("plugins.persistence")
require("plugins.mini")
require("plugins.autosave")
require("plugins.tiny_diagnostics")
require("plugins.lazydocker")
require("plugins.listchars")
require("plugins.pymple")
require("plugins.uv-manager")
