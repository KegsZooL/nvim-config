local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	change_detection = {
		-- Don't notify us every time a change is made to the configuration
		notify = false,
	},
	checker = {
		-- Automatically check for package updates
		enabled = true,
		-- Don't spam us with notification every time there is an update available
		notify = false,
	},
}
require("lazy").setup({
    {"folke/which-key.nvim"},
    {"folke/neoconf.nvim", cmd = "Neoconf" },
    {"folke/neodev.nvim"},
    {"ellisonleao/gruvbox.nvim"},
    {'nvim-treesitter/nvim-treesitter'},
    {'neovim/nvim-lspconfig'},
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ'
        }
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {
          'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
      }
    },
    {'nvim-tree/nvim-web-devicons'},
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker"
      }
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      "mfussenegger/nvim-jdtls",
      dependencies = {
          "mfussenegger/nvim-dap",
      }
    },
    {"williamboman/mason.nvim"},
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
          "neovim/nvim-lspconfig", -- mason lsp config uses mason to automatically ensure that the lsp servers
      }                            -- you want to install are installed
    },                            
    {"jay-babu/mason-nvim-dap.nvim"},  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed,
                                       -- mason-lspconfig will not automatically install debug adapters for us
  })