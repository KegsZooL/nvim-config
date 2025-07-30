require('tiny-inline-diagnostic').setup({
    preset = "classic",
    signs = {
        arrow = "",
    },
    use_icons_from_diagnostic = true,
})
vim.diagnostic.config({ virtual_text = false })
