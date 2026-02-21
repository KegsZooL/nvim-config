return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      notify = {
        enabled = false,
      },
      messages = {
        enabled = true,
        view_search = false,
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
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        hover = {
          enabled = true,
        }
      },
      presets = {
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
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
        hover = {
          border = {
            style = "rounded",
          },
          size = {
            max_width = 120,
            max_height = 30,
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
          focusable = true,
        },
      },
      routes = {
        -- {
        --   filter = {
        --     event = "lsp",
        --     kind = "progress",
        --   },
        --   opts = { skip = true },
        -- }
      },
      status = { lsp_progress = { event = "lsp", kind = "progress" } }
    })
  end
}
