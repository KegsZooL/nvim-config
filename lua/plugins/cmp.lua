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
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'vim-dadbod-completion' }, -- SQL
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

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})
