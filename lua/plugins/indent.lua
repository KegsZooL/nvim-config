local hooks = require("ibl.hooks")
local api = vim.api

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowTeal",
    "RainbowGreen",
    "RainbowOrange",
    "RainbowCyan",
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
    api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
    api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
    api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
    api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
    api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
    api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
end)

local function should_use_indent(bufnr)
    local filetype = api.nvim_get_option_value("filetype", { buf = bufnr })
    return vim.tbl_contains({
        "lua", "java", "cpp", "c",
        "py", "HTML", "css", "xml"
    }, filetype)
end

hooks.register(hooks.type.ACTIVE, function(bufnr)
    return should_use_indent(bufnr)
end)

local ibl = require("ibl")
ibl.setup({
    indent = {
        char = "│",
        tab_char = "│",
        highlight = highlight,
    },
    scope = {
        enabled = false,
    },
    vim.opt.listchars:append("space: "),
})
