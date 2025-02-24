require("noice").setup({
    notify = {
        enabled = true,
    },
    messages = {
        enabled = true, -- views standard vim/nvim log messages
        view_search = false, -- view for search count messages. Set to `false` to disable
    },
    cmdline = {
        format = {
            cmdline = { pattern = "^:", icon = "  ", lang = "vim", title = " Command " },
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
        signature = {
            enabled = false,
        },
    },
    presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
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
                width = "15%"
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
      {
        filter = {
            event = "lsp",
            kind = "progress",
        },
        opts = { skip = true },
      }
    },
    status = { lsp_progress = { event = "lsp", kind = "progress" } }
})
