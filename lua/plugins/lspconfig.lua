local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
            },
            hint = {
                enable = true,
                arrayIndex = 'Disable',
            }
        }
    },
    presets = {
        lsp_doc_border = true,
    },
})


lspconfig.basedpyright.setup({
  capabilities = capabilities,
  settings = {
    basedpyright = {
      analysis = {
        diagnosticMode = "workspace",
        autoSearchPaths = true,
        enableReachabilityAnalysis = false,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticSeverityOverrides = {
          reportImportCycles = true,
          reportArgumentType = true,
          reportMissingTypeStubs = "warning",
          reportAttributeAccessIssue = true,
          reportMissingTypeArgument = "warning",
          reportIncompatibleMethodOverride = "warning",
          reportUnusedCallResult = "warning",
          reportOptionalSubscript = "warning",
          reportCallIssue = true,
          reportConstantRedefinition = "warning",
          reportImplicitRelativeImport = "warning",
          reportUnannotatedClassAttribute = false,
          reportUnknownParameterType = false,
          reportUnknownArgumentType = false,
          reportUnknownMemberType = false,
          reportUnknownVariableType = false,
          reportAny = false,
          reportExplicitAny = false,
          reportAssignmentType = false,
          reportImplicitOverride = false,
          reportIndexIssue = false,
          reportGeneralTypeIssues = false,
          reportUndefinedVariable = false, -- using in ruff
          reportUnusedImport = false, -- using in ruff
          reportUnusedVariable = false, -- using in ruff
        },
        inlayHints = {
          callArgumentNames = true,
        },
        extraPaths = {
          "./saltbox_bridge",
        }
      },
    },
  },
})

-- lspconfig.pyright.setup({
--   capabilities = capabilities,
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         ignore = { '*' },
--       },
--     },
--   },
-- })

-- lspconfig.pylsp.setup {
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       configurationSources = { 'flake8' },
--       plugins = {
--         mypy = {
--           enable = true,
--           overrides = { '--check-untyped-defs' },
--         },
--         flake8 = { enabled = false },      -- concurrents with Ruff
--         mccabe = { enabled = false },      -- already in Flake8
--         pycodestyle = { enabled = false }, -- already in Flake8
--         pyflakes = { enabled = false },    -- already in Flake8
--         pylint = { enabled = false },
--       }
--     }
--   }
-- }

lspconfig.ruff.setup {
  capabilities = capabilities,
  root_dir = require("lspconfig.util").root_pattern("pyproject.toml", ".git"),
}

lspconfig.graphql.setup({
    capabilities = capabilities,
    filetypes = {
        "graphql", "gql",
        "svelte", "typescriptreact",
        "javascriptreact"
    }
})

require('go').setup{
  lsp_cfg = false,
  capabilities = capabilities,
  filetypes = { 'go' },
  root_dir = require('lspconfig.util').root_pattern(".git", "go.mod", ".")
}
local cfg = require'go.lsp'.config()
lspconfig.gopls.setup(cfg)

lspconfig.jsonls.setup {
    capabilities = capabilities,
}

vim.filetype.add {
    extension = {
      jinja = 'jinja',
      jinja2 = 'jinja',
      j2 = 'jinja',
      tmpl = 'jinja'
    },
    pattern = {
      ['.*%.cfg%.tmpl'] = 'jinja',
    }
}

lspconfig.jinja_lsp.setup ({
  capabilities = capabilities,
  filetypes = { 'jinja', 'salt', 'sls', 'tmpl' },
})

lspconfig.ts_ls.setup({
    capabilities = capabilities,
    settings = {
       typescript = {
           inlayHints = {
               includeInlayParameterNameHints = "all",
               includeInlayParameterNameHintsWhenArgumentMatchesName = true,
               includeInlayFunctionParameterTypeHints = true,
               includeInlayVariableTypeHints = true,
               includeInlayVariableTypeHintsWhenTypeMatchesName = true,
               includeInlayPropertyDeclarationTypeHints = true,
               includeInlayFunctionLikeReturnTypeHints = true,
               includeInlayEnumMemberValueHints = true,
           },

       },
       javascript = {
           inlayHints = {
               includeInlayParameterNameHints = "all",
               includeInlayParameterNameHintsWhenArgumentMatchesName = true,
               includeInlayFunctionParameterTypeHints = true,
               includeInlayVariableTypeHints = true,
               includeInlayVariableTypeHintsWhenTypeMatchesName = true,
               includeInlayPropertyDeclarationTypeHints = true,
               includeInlayFunctionLikeReturnTypeHints = true,
               includeInlayEnumMemberValueHints = true,
            },
        },
    }
})

lspconfig.bashls.setup({
    capabilities = capabilities
})

lspconfig.dockerls.setup({
    capabilities = capabilities
})

lspconfig.yamlls.setup({
    capabilities = capabilities,
    filetypes = { "yaml" }
})
