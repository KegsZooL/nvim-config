local telescope = require("telescope")
local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup{
    defaults = {
        file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
            "%.pdf", "%.mkv", "%.mp4", "%.zip"},
        mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
        },
    }
}
