return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
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
        ["["] = "]",
        ["{"] = "}",
      },
    })
  end
}
