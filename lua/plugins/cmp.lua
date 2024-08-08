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

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    -- completion = {
    --     autocomplete = false,
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
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
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'emoji' },
        { name = 'vscode-json-language-server' },
        { name = 'pyright-langserver' },
        { name = 'sqls' },
        { name = 'marksman' },
        { name = 'vscode-html-language-server'},
        { name = 'vscode-css-language-server'}
    }),
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
           vim_item.kind = string.format('   %s %s', kind_icons[vim_item.kind], vim_item.kind)

           local source = entry.source.name
           vim_item.menu = ({
              copilot	= "(copilot)",
              luasnip	= "(luasnip)",
              nvim_lua = "(nvim_lua)",
              nvim_lsp = "(lsp)",
              buffer	= "(buffer)",
              abl		= "(abl)",
              path		= "(path)",
           })[source]

           -- Removing dublicates
           if source == "luasnip"
              or source == "nvim_lsp"
              or source == "nvim_lua"
              or source == "abl" then
              vim_item.dup = 0
           end
           return vim_item
        end,
    },
    experimental = {
        ghost_text = false
    }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})
