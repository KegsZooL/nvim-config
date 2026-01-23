local ok, illuminate = pcall(require, "illuminate")
if not ok then return end

illuminate.configure({
  providers = {
    "lsp",
    "treesitter",
    -- "regex",  -- disabled for performance
  },
  delay = 200,  -- increased from 100 for better performance
  filetype_overrides = {},
  filetypes_denylist = {
    "lube",
    "TelescopeResults",
    "query",
    "gitrebase",
    "gitcommit",
    "tsplayground",
    "lazy",
    "lsp-installer",
    "markdown",
    "mason",
    "text",
    "dashboard",
    "alpha",
    "NvimTree",
    "undotree",
    "diff",
    "fugitive",
    "fugitiveblame",
    "Outline",
    "SidebarNvim",
    "packer",
    "lsp-installer",
    "TelescopePrompt",
    "help",
    "telescope",
    "lspinfo",
    "Trouble",
    "null-ls-info",
    "quickfix",
    "chadtree",
    "fzf",
    "NeogitStatus",
    "terminal",
    "console",
    "term://*",
    "Term://*",
    "toggleterm",
    "qf",
    "prompt",
    "noice",
    "",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = 5000,  -- disable for files > 5000 lines
  large_file_overrides = {
    providers = { "lsp" },  -- only use LSP for large files
  },
  min_count_to_highlight = 2,  -- don't highlight unique occurrences
})
