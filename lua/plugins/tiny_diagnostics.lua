local ok, tiny_diag = pcall(require, 'tiny-inline-diagnostic')
if not ok then return end

tiny_diag.setup({
    preset = "classic",
    signs = {
        arrow = "",
    },
    use_icons_from_diagnostic = true,
})
-- virtual_text = false is set in core/configs.lua
