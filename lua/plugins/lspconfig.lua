local util           = require("lspconfig.util")
local lspconfig      = require("lspconfig")
local capabilities   = require("cmp_nvim_lsp").default_capabilities()

-- Allow servers (basedpyright, ruff, etc.) to register file watchers so external renames are noticed
capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.didChangeWatchedFiles = capabilities.workspace.didChangeWatchedFiles or {}
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
capabilities.workspace.workspaceFolders = true

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

-------------------------------------
--            TS/Vue               --
-------------------------------------

local ts_filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'vue'
}

local vue_ts_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_ts_plugin_path(),
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_ts_plugin,
        },
      },
    },
  },
  filetypes = ts_filetypes,
}

vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', {})
vim.lsp.enable({'vtsls', 'vue_ls'})

-------------------------------------
--            HTML/CSS             --
-------------------------------------

local root_dir_css = {
  "package.json",
  "package-lock.json",
  "tsconfig.json",
  "tsconfig.node.json",
  "vite.config.ts"
}

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { "html", "ejs" },
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  filetypes = { "css", "scss", "less" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
  root_dir = util.root_pattern(root_dir_css)
})

-------------------------------------
--              Lua                --
-------------------------------------

require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
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

-------------------------------------
--             Python              --
-------------------------------------

lspconfig.ruff.setup({
  capabilities = capabilities,
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
          reportAttributeAccessIssue = true,
          reportImportCycles = "warning",
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
          reportImplicitOverride = false,
          reportIndexIssue = false,
          reportGeneralTypeIssues = false,
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


lspconfig.graphql.setup({
  capabilities = capabilities,
  filetypes = {
    "graphql", "gql",
    "svelte", "typescriptreact",
    "javascriptreact"
  }
})


-------------------------------------
--              GO                 --
-------------------------------------

require('go').setup{
  lsp_cfg = false,
  capabilities = capabilities,
  filetypes = { 'go' },
  root_dir = util.root_pattern(".git", "go.mod", ".")
}
local cfg = require'go.lsp'.config()
lspconfig.gopls.setup(cfg)


lspconfig.jsonls.setup {
  capabilities = capabilities,
}

-------------------------------------
--             JINJA2              --
-------------------------------------

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

-------------------------------------
--             NGINX               --
-------------------------------------

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
