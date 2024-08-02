local wk = require("which-key")

wk.setup({
    icons = {
        rules = false,
        separator = "➜",
        group = "",
    },
    show_keys = false,
    show_help = false, -- show a help message in the command line for using WhichKey
        align = "center",
        layout = {
    },
    win = {
        border = "double",
        title = false,
        padding = { 1, 1 }, -- extra window padding [top/bottom, right/left]
        no_overlap = true,
    },
    wk.add({
        { "<leader>f", group = "Telescope" },
        { "<leader>l", group = "LSP" },
        { "<leader>o", group = "Options Commands" },
        { "<leader>g", group = "Gitsigns" },
    }),
})
