local surround = require("nvim-surround")

surround.setup({
    keymaps = {
        normal = "C",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
})
