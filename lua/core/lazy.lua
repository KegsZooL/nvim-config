local fn = vim.fn;
local opt = vim.opt;
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "sainnhe/gruvbox-material" },
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate'
    },
    { 'neovim/nvim-lspconfig', event = { "BufReadPre", "BufNewFile" } },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'hrsh7th/nvim-cmp',
        lazy = false,  -- cmp must load early for LSP capabilities
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'saadparwaiz1/cmp_luasnip',
            { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
            'rafamadriz/friendly-snippets',
        },
    },
    { 'hrsh7th/vscode-langservers-extracted' },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {
        'linrongbin16/lsp-progress.nvim'
      }
    },
    {
      'nvim-telescope/telescope.nvim', branch = 'master',
      cmd = "Telescope",
      keys = { "<leader>f", "<leader>g" },
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "williamboman/mason.nvim", cmd = "Mason" },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
          "neovim/nvim-lspconfig",       -- mason lsp config uses mason to automatically ensure that the lsp servers
      }                                  -- you want to install are installed
    },
    { "jay-babu/mason-nvim-dap.nvim" },  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed,
                                         -- mason-lspconfig will not automatically install debug adapters for us
    { 'akinsho/bufferline.nvim', version = "*" },
    { "norcalli/nvim-colorizer.lua", event = "BufReadPost" },
    { 'akinsho/toggleterm.nvim', version = "*", config = true, cmd = "ToggleTerm" },
    { 'fedepujol/move.nvim' },
    { 'onsails/lspkind.nvim' },
    { "christoomey/vim-system-copy" },
    { "numToStr/Comment.nvim", event = "BufReadPost" },
    { "nvimdev/dashboard-nvim" },
    { "rcarriga/nvim-notify" },
    { "folke/trouble.nvim", cmd = "Trouble", event = "LspAttach" },
    { "nvimdev/lspsaga.nvim", event = "LspAttach" },
    { "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    { 'echasnovski/mini.nvim', version = false },
    { 'lewis6991/gitsigns.nvim', event = "BufReadPre" },
    {
      "sphamba/smear-cursor.nvim"
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
      },
      lazy = false, -- neo-tree will lazily load itself
    },
    { "folke/which-key.nvim", event = "VeryLazy" },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {}
    },
    { "lambdalisue/vim-suda" },
    {
        "kylechui/nvim-surround",
        version = "*",                  -- Use for stability; omit to use `main` branch for the latest features
    },
    { "rcarriga/nvim-dap-ui",
      lazy = true,
      dependencies = {
          "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
      }
    },
    { "theHamsta/nvim-dap-virtual-text", lazy = true },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    { "allaman/emoji.nvim" },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
        },
    },
    {
        "ray-x/web-tools.nvim",         -- Website preview
        dependencies = {
            'Orange-OpenSource/hurl',   -- HTTP requests
            'BrowserSync/browser-sync'
        },
    },
    { "max397574/colortils.nvim" },     -- Color picker
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    { "RRethy/vim-illuminate", event = "BufReadPost" },
    { "windwp/nvim-ts-autotag", event = "InsertEnter" },
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("inlay-hints").setup()
        end
    },
    { "sqls-server/sqls" },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
        { 'tpope/vim-dadbod' },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }}
        }
    },
    { 'mg979/vim-visual-multi' },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
    },
    { "bergercookie/asm-lsp" },
    { "nvimtools/none-ls.nvim" },
    { "mfussenegger/nvim-dap-python", ft = "python", lazy = true },
    { "typeddjango/django-stubs" },
    { "leoluz/nvim-dap-go", ft = "go", lazy = true },
    {
      "ray-x/go.nvim",
      dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      opts = {
        lsp_keymaps = false,
      },
      config = function(lp, opts)
        require("go").setup(opts)

      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "pocco81/auto-save.nvim", event = { "InsertLeave", "TextChanged" } },
    { "rachartier/tiny-inline-diagnostic.nvim", event = "LspAttach" },
    {
      "GeorgesAlkhouri/nvim-aider",
      dependencies = {
        "folke/snacks.nvim"
      }
    },
    {"mikavilpas/yazi.nvim", cmd = "Yazi" },
    {"crnvl96/lazydocker.nvim", cmd = "Lazydocker" },
    { "0xfraso/nvim-listchars", opts = true },
    {
      "alexpasmantier/pymple.nvim",
      ft = "python",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "stevearc/dressing.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      build = ":PympleBuild",
    },
    {
      "kdheepak/lazygit.nvim",
      cmd = "LazyGit",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    { 'benomahony/uv.nvim', ft = "python" }
}, {
  -- Performance optimizations
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
