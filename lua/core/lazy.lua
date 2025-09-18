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
    { "folke/which-key.nvim" },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "folke/neodev.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "sainnhe/gruvbox-material" },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'ray-x/lsp_signature.nvim',
            'rafamadriz/friendly-snippets',
        }
    },
    { 'hrsh7th/vscode-langservers-extracted' },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = {
        'linrongbin16/lsp-progress.nvim'
      }
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "williamboman/mason.nvim" },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
          "neovim/nvim-lspconfig",       -- mason lsp config uses mason to automatically ensure that the lsp servers
      }                                  -- you want to install are installed
    },
    { "jay-babu/mason-nvim-dap.nvim" },  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed,
                                         -- mason-lspconfig will not automatically install debug adapters for us
    { 'akinsho/bufferline.nvim', version = "*" },
    { "norcalli/nvim-colorizer.lua" },
    { 'akinsho/toggleterm.nvim', version = "*", config = true }, -- console in nvim
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    { 'L3MON4D3/LuaSnip' },
    { 'fedepujol/move.nvim' },
    { 'onsails/lspkind.nvim' },
    { "christoomey/vim-system-copy" },
    { "numToStr/Comment.nvim" },
    { "nvimdev/dashboard-nvim" },
    { "rcarriga/nvim-notify" },
    { "folke/trouble.nvim" },
    { "nvimdev/lspsaga.nvim" },
    { "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    { 'echasnovski/mini.nvim', version = false },
    { 'lewis6991/gitsigns.nvim' },
    { "folke/which-key.nvim" },
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
      dependencies = {
          "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
      }
    },
    { "theHamsta/nvim-dap-virtual-text" },
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
    { "RRethy/vim-illuminate" },        --  Automatically highlighting other uses of the word under the cursor
    { "windwp/nvim-ts-autotag" },
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
    { "jose-elias-alvarez/null-ls.nvim" },
    { "mfussenegger/nvim-dap-python" },
    { "typeddjango/django-stubs" },
    { "lvimuser/lsp-inlayhints.nvim" },
    { "leoluz/nvim-dap-go" },
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
    { "pocco81/auto-save.nvim" },
    { "rachartier/tiny-inline-diagnostic.nvim" },
    {
      "GeorgesAlkhouri/nvim-aider",
      dependencies = {
        "folke/snacks.nvim"
      }
    },
    {"mikavilpas/yazi.nvim"},
    {"crnvl96/lazydocker.nvim"},
    { "0xfraso/nvim-listchars", opts = true }
})
