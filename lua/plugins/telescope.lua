local telescope = require("telescope")
local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add
local ignore_files = require("ignore_files").pattern

telescope.setup{
    pickers = {
        find_files = {
            no_ignore = true,
            hidden = true,
        },
        oldfiles = {
            prompt_prefix = "   ",
        },
        git_status = {
            prompt_prefix = "  ",
            git_icons = {
                added = "",
                changed = "󰜥",
                copied = "",
                deleted = "󰆴",
                renamed = "",
                unmerged = "‡",
                untracked = "",
            },
        },
        git_commits = {
          prompt_prefix = "  ",
        },
        git_bcommits = {
          prompt_prefix = "  ",
        },
        git_branches = {
          prompt_prefix = "  ",
        },
        git_files = {
          prompt_prefix = "  ",
        },
        buffers = {
            sort_lastused = true,
            prompt_prefix = "   ",
        }
    },

    defaults = {
        file_ignore_patterns = ignore_files,
        mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
        },
        prompt_prefix = "   ",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.6,
            results_width = 0.7,
          },
          vertical = { mirror = true },
          width = 0.9,
          height = 0.9,
          preview_cutoff = 120,
        },
    },
}
