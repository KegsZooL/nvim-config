local surround = require("nvim-surround")

surround.setup({
    keymaps = {
        normal = "q",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
    surrounds = {
        ["("] = false,
    },
    aliases = {
        ["("] = ")",
    },
})
