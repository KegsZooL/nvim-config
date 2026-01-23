local ok, neo_tree = pcall(require, "neo-tree")
if not ok then return end

local function disabled_action(msg)
end

neo_tree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    use_popups_for_input = false,

    source_selector = {
        winbar = false,  -- disable header
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
                modified  = "",
                deleted   = "✖",
                renamed   = "󰁕",
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
            },
        },
    },

    window = {
        position = "left",
        width = 35,
        auto_expand_width = false,  -- Fixed width

        mapping_options = {
            noremap = true,
            nowait = true,
        },

        mappings = {
            -- Navigation only
            ["<space>"] = { "toggle_node", nowait = false },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["o"] = "open",
            ["<esc>"] = "cancel",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "open",
            ["h"] = "close_node",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["Z"] = "expand_all_nodes",

            -- Search
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",

            -- Refresh
            ["R"] = "refresh",

            -- Info
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",

            -- DISABLED operations (use Yazi)
            ["a"] = disabled_action(),
            ["A"] = disabled_action(),
            ["d"] = disabled_action(),
            ["r"] = disabled_action(),
            ["y"] = disabled_action(),
            ["x"] = disabled_action(),
            ["p"] = disabled_action(),
            ["c"] = disabled_action(),
            ["m"] = disabled_action(),
        },
    },

    filesystem = {
        bind_to_cwd = true,
        cwd_target = { sidebar = "window" },

        filtered_items = {
            visible = false,          -- Hide filtered items
            hide_dotfiles = true,     -- Hide dotfiles
            hide_gitignored = false,   -- Hide gitignored files
            hide_hidden = true,       -- Hide hidden files
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
        use_libuv_file_watcher = true,  -- Auto refresh on file changes
        group_empty_dirs = false,

        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
                ["gy"] = disabled_action(),
            },
        },
    },

    buffers = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = disabled_action(),
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
            },
        },
    },

    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"]  = disabled_action(),
                ["gu"] = disabled_action(),
                ["ga"] = disabled_action(),
                ["gr"] = disabled_action(),
                ["gc"] = disabled_action(),
                ["gp"] = disabled_action(),
                ["gg"] = disabled_action(),
            },
        },
    },
})

-- Auto-open neo-tree when LSP attaches
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
                    return  -- Already open
                end
            end
            vim.cmd("Neotree show left")
        end, 100)
    end,
})
