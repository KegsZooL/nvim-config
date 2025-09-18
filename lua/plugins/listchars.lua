require("nvim-listchars").setup({
  save_state = true,      -- If enabled, save toggled state in a cache file. Will overwrite current `vim.opt.list` value.
  listchars = {
    tab = "→\\",
    trail = "·",
    space = "·",
    nbsp = "↔",
    eol = "$"
  },
  notifications = false,
  exclude_filetypes = {}, -- List of filetypes where `listchars` is disabled
  lighten_step = 5,       -- Amount to add/remove from base color
})
