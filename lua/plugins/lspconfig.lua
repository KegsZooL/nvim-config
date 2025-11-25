local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local mason_registry = require('mason-registry')
local mason_settings = require('mason.settings')

local function vue_ts_plugin_path()

    if not mason_registry.has_package('vue-language-server') then
     return nil
   end

   return vim.fs.joinpath(
     mason_settings.current.install_root_dir,
     'packages',
     'vue-language-server',
     'node_modules', '@vue', 'language-server',
     'node_modules', '@vue', 'typescript-plugin'
   )
end


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
        -- diagnosticMode = "workspace",
        diagnosticMode = "openFilesOnly",
        autoSearchPaths = true,
        enableReachabilityAnalysis = false,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticSeverityOverrides = {
          reportImportCycles = true,
          reportAttributeAccessIssue = true,
          reportArgumentType = "warning",
          reportMissingTypeStubs = "warning",
          reportMissingTypeArgument = "warning",
          reportIncompatibleMethodOverride = "warning",
          reportPossiblyUnboundVariable = "warning",
          reportUnusedCallResult = "warning",
          reportOptionalSubscript = "warning",
          reportCallIssue = "warning",
          reportConstantRedefinition = "warning",
          reportImplicitRelativeImport = "warning",
          reportUnsafeMultipleInheritance = "warning",
          reportIncompatibleVariableOverride = "warning",
          reportUninitializedInstanceVariable = false,
          reportOperatorIssue = false,
          reportUnannotatedClassAttribute = false,
          reportUnknownParameterType = false,
          reportUnknownArgumentType = false,
          reportUnknownMemberType = false,
          reportUnknownVariableType = false,
          reportAny = false,
          reportExplicitAny = false,
          -- reportAssignmentType = false,
          reportImplicitOverride = false,
          reportIndexIssue = false,
          reportGeneralTypeIssues = false,
          -- reportUndefinedVariable = false, -- using in ruff
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

lspconfig.ruff.setup({
  capabilities = capabilities,
})

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

local vue_ls_path = vue_ts_plugin_path()
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    init_options = {
        plugins = {
            {
               name = '@vue/typescript-plugin',
               location = vue_ls_path,
               languages = { 'vue' },
            }
        },
    },
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
       filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
    }
})

lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { "html", "ejs" },
})

lspconfig.volar.setup({
    capabilities = capabilities,
})

lspconfig.bashls.setup({
    capabilities = capabilities,
})

lspconfig.dockerls.setup({
    capabilities = capabilities,
})

lspconfig.yamlls.setup({
    capabilities = capabilities,
    filetypes = { "yaml" }
})


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.template", "*.tmpl" },
  callback = function()
    vim.bo.filetype = "nginx"
  end,
})

lspconfig.nginx_language_server.setup({
    capabilities = capabilities,
    filetypes = { 'template', 'tmpl', 'nginx', 'conf', },
})
