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


-------------------------------------
--            TS/Vue               --
-------------------------------------

local vue_ts_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_ts_plugin_path(),
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local ts_filetypes = { 'javascript','javascriptreact','typescript','typescriptreact','vue' }

lspconfig.vtsls.setup({
  capabilities = capabilities,
  filetypes = ts_filetypes,
  settings = { vtsls = { tsserver = { globalPlugins = { vue_ts_plugin } } } },
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  filetypes = ts_filetypes,
  init_options = { plugins = { vue_ts_plugin } },
  settings = { typescript = { inlayHints = { '…' } }, javascript = { inlayHints = { '…' } } },
})

lspconfig.vue_ls.setup({
  capabilities = capabilities,
  on_init = function(client)
  client.handlers['tsserver/request'] = function(_, result, ctx)
  local ts = vim.lsp.get_clients({ bufnr = ctx.bufnr, name = 'vtsls' })[1]
    if not ts then return end
    local id, command, payload = table.unpack(result)
      ts:exec_cmd({ command = 'typescript.tsserverRequest', arguments = { command, payload } }, { bufnr = ctx.bufnr },
        function(_, r) client:notify('tsserver/response', { { id, r and r.body } }) end)
      end
  end,
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
  root_dir = require('lspconfig.util').root_pattern(".git", "go.mod", ".")
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


lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { "html", "ejs" },
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
