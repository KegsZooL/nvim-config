local lspsaga = require("lspsaga")

lspsaga.setup({
    debug = false,
    use_saga_diagnostic_sign = true,
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    diagnostic_header_icon = "   ",
    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤",
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",

    lightbulb = {
        enable = false
    },
    symbol_in_winbar = {
        enable = false,
    },
    hover = {
        max_width = 0.9,
        silent = true
    },
    rename = {
        auto_save = true,
        keys = {
            quit = '<Esc>',
            exec = '<CR>'
        }
    },
    code_action = {
        quit = '<Esc>',
        keys = {
            exec = '<CR>'
        }
    },
})
