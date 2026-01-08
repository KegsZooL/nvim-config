local util           = require("lspconfig.util")
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

vim.lsp.config('html', {
  capabilities = capabilities,
  filetypes = { "html", "ejs" },
})

vim.lsp.config('cssls', {
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

vim.lsp.config('lua_ls', {
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

vim.lsp.config('ruff', {
  capabilities = capabilities,
})

vim.lsp.config('basedpyright', {
  capabilities = capabilities,
  before_init = function(_, config)
    local python_path = vim.fn.system("pyenv which python3 2>/dev/null"):gsub("%s+", "")
    if python_path ~= "" and vim.fn.executable(python_path) == 1 then
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = python_path
    end
  end,
  settings = {
    basedpyright = {
      analysis = {
        diagnosticMode = "workspace",
        autoSearchPaths = true,
        enableReachabilityAnalysis = false,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        venvPath = vim.fn.expand("~/.pyenv/versions"),
        venv = vim.fn.system("pyenv version-name 2>/dev/null"):gsub("%s+", ""),
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
        extraPaths = (function()
          local paths = { "./saltbox_bridge" }
          local pyenv_root = vim.fn.expand("~/.pyenv/versions")
          local version_name = vim.fn.system("pyenv version-name 2>/dev/null"):gsub("%s+", "")
          if version_name ~= "" then
            local site_packages = string.format("%s/%s/lib/python*/site-packages", pyenv_root, version_name)
            local expanded = vim.fn.glob(site_packages, false, true)
            for _, path in ipairs(expanded) do
              table.insert(paths, path)
            end
          end
          return paths
        end)()
      },
    },
  },
})


vim.lsp.config('graphql', {
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
vim.lsp.config('gopls', cfg)


vim.lsp.config('jsonls', {
  capabilities = capabilities,
})

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
vim.lsp.config('jinja_lsp', {
  capabilities = capabilities,
  filetypes = { 'jinja', 'salt', 'sls', 'tmpl' },
})


vim.lsp.config('bashls', {
  capabilities = capabilities,
})


vim.lsp.config('dockerls', {
  capabilities = capabilities,
})


vim.lsp.config('yamlls', {
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

vim.lsp.config('nginx_language_server', {
  capabilities = capabilities,
  filetypes = { 'template', 'tmpl', 'nginx', 'conf', },
})

-------------------------------------
--        Enable all servers       --
-------------------------------------

vim.lsp.enable({
  'html',
  'cssls',
  'lua_ls',
  'ruff',
  'basedpyright',
  'graphql',
  'gopls',
  'jsonls',
  'jinja_lsp',
  'bashls',
  'dockerls',
  'yamlls',
  'nginx_language_server',
})
