return {
  'hrsh7th/nvim-cmp',
  event = { "InsertEnter", "CmdlineEnter" },
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
  config = function()
    local cmp = require 'cmp'
    local kind_icons = {
       Text          = "󰊄",
       Method        = "󰊕",
       Function      = "󰊕",
       Constructor   = "",
       Field         = "",
       Variable      = "",
       Class         = "",
       Interface     = "",
       Module        = "",
       Property      = "",
       Unit          = "",
       Value         = "",
       Enum          = "",
       Keyword       = "",
       Snippet       = "",
       Color         = "",
       File          = "",
       Reference     = "",
       Folder        = "",
       EnumMember    = "",
       Constant      = "",
       Struct        = "",
       Event         = "",
       Operator      = "",
       TypeParameter = "",
    }

    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load({
      include = {
        "python", "javascript", "go", "typescript", "sh",
        "c", "cpp", "ruby", "rust", "lua",
      }
    })

    ls.filetype_extend("python", { "pydoc" })
    ls.filetype_extend("sh", { "shelldoc" })
    ls.filetype_extend("typescript", { "tsdoc" })
    ls.filetype_extend("javascript", { "jsdoc" })
    ls.filetype_extend("lua", { "luadoc" })
    ls.filetype_extend("rust", { "rustdoc" })
    ls.filetype_extend("cs", { "csharpdoc" })
    ls.filetype_extend("go", { "godoc" })
    ls.filetype_extend("java", { "javadoc" })
    ls.filetype_extend("c", { "cdoc" })
    ls.filetype_extend("cpp", { "cppdoc" })
    ls.filetype_extend("php", { "phpdoc" })
    ls.filetype_extend("kotlin", { "kdoc" })
    ls.filetype_extend("ruby", { "rdoc" })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping(function ()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, {"i", "s"})
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'vim-dadbod-completion' },
      }),
      formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
          if kind_icons and kind_icons[item.kind] then
            item.kind = string.format('   %s %s', kind_icons[item.kind], item.kind)
          end

          local n = entry.source.name
          if n == 'nvim_lsp' then
            item.menu = '[LSP]'
          else
            item.menu = string.format('[%s]', n)
          end

          return item
        end,
      },
      experimental = {
        ghost_text = false
      },
      matching = { disallow_symbol_nonprefix_matching = true }
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        {name = 'cmp_git'}
      }, {{name = 'buffer'}})
    })
  end
}
