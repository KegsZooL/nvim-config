require("noice").setup({
    cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {}, -- global options for the cmdline. See section on views
        format = {
            cmdline = { pattern = "^:", icon = " ", lang = "vim", title = " Command " },
            search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex", title = " Search" },
            filter = { pattern = "^:%s*!", icon = "  ", lang = "bash" , title = " Filter " },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua", title = " Lua " },
            help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰋖", title = " Help " },
            input = {}, -- Used by input()
      },
    },
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
        },
        message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = "mini",
            opts = {},
        },
        hover = {
            enabled = true,
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
        },
        signature = {
            enabled = true,
            auto_open = {
                enabled = true,
                trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            opts = {}, -- merged with defaults from documentation
        },
    },
    presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    views = {
        cmdline_popup = {
            position = {
                row = "50%",
                col = "50%",
            },
            size = {
                width = "40%",
                height = "auto",
            },
            filter_options = {},
            win_options = {
                winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" },
            },
        },
        split = {
            enter = true,
        },
        notify = {
            size = {
                width = 30
            }
        },
        mini = {
            win_options = {
                winblend = 0,
            }
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 8,
                col = "50%",
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "TelescopePromptNormal", FloatBorder = "DiagnosticInfo" },
            },
        },
    },
    routes = {
      {
        filter = {
            event = "msg_show",
            kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
            event = "msg_show",
            kind = "",
            find = "written",
        },
        opts = { skip = true },
      },
    },
})
