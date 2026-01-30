return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = "classic",
      signs = {
        arrow = "",
      },
      use_icons_from_diagnostic = true,
    })
  end
}
