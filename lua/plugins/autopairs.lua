local nvim_autopairs = require("nvim-autopairs")
local nvim_autopairs_completion = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

require("nvim-autopairs").setup {
    check_ts = true, -- includes treesitter support
    map_cr = true, --  map <CR>(ENTER) on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function/method item
    auto_select = false, -- auto select first item
    map_char = {
        -- modifies the function or method delimiter by filetypes
        all = "(", -- default function separator
        tex = "{", -- function separator for TeX files
    },
}
-- If you want insert `(` after select function or method item
cmp.event:on("confirm_done", nvim_autopairs_completion.on_confirm_done())