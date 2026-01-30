return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  config = function()
    require('lsp-lens').setup({
      enable = true,
      sections = {
        definition = false,
        referneces = true,
        implements = true,
        git_authors = false
      }
    })
  end
}
