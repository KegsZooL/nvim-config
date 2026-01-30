return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      use_popups_for_input = false,

      source_selector = {
        winbar = false,
        statusline = false,
        show_scrolled_off_parent_node = false,
        sources = {
          { source = "filesystem", display_name = false},
        },
        content_layout = "start",
        tabs_layout = "equal",
        truncation_character = "…",
        tabs_min_width = nil,
        tabs_max_width = nil,
        padding = 0,
        separator = { left = "▏", right = "▕" },
        separator_active = nil,
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },

      enable_git_status = true,
      enable_diagnostics = true,
      enable_modified_markers = true,

      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "Outline" },

      default_component_configs = {
        container = { enable_character_fade = true },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        modified = { symbol = "[+]", highlight = "NeoTreeModified" },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      window = {
        position = "left",
        width = 35,
        auto_expand_width = false,

        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },

      filesystem = {
        bind_to_cwd = true,
        cwd_target = { sidebar = "window" },

        window = {
          mappings = {
            ["/"] = "filter_as_you_type",
            ["<Esc>"] = "clear_filter",
            ["gn"] = "prev_git_modified",
            ["gp"] = "next_git_modified",
          },
        },

        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = true,
          hide_by_name = {
            ".git",
            "node_modules",
            "__pycache__",
            ".venv",
            ".mypy_cache",
            ".pytest_cache",
            ".ruff_cache",
          },
          hide_by_pattern = {
            "*.pyc",
          },
          always_show = {
            ".gitignore",
            ".env",
            ".env.local",
            ".python-version",
          },
          never_show = {},
          never_show_by_pattern = {},
        },

        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },

        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        group_empty_dirs = false,
      },

      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = true,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local filetype = vim.bo[bufnr].filetype

        local skip_ft = { "neo-tree", "dashboard", "lazy", "mason", "help", "qf", "toggleterm" }
        for _, ft in ipairs(skip_ft) do
          if filetype == ft then return end
        end

        vim.defer_fn(function()
          local wins = vim.api.nvim_list_wins()
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft == "neo-tree" then
              return
            end
          end
          vim.cmd("Neotree show left")
        end, 100)
      end,
    })
  end
}
