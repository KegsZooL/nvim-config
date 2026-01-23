require("neo-tree").setup({
  close_if_last_window = false,
  popup_border_style = "NC",

  use_popups_for_input = false,

  clipboard = {
    sync = "none",
  },

  enable_git_status = true,
  enable_diagnostics = true,

  open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
  open_files_using_relative_paths = false,

  sort_case_insensitive = false,
  sort_function = nil,

  default_component_configs = {
    container = { enable_character_fade = true },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    modified = { symbol = "[+]", highlight = "NeoTreeModified" },
    name = {
      trailing_slash = false,
      use_filtered_colors = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
  },

  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_ignored = false,
    },

    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },

    hijack_netrw_behavior = "open_default",
    group_empty_dirs = false,
    use_libuv_file_watcher = false,
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

