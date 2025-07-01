local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

lspconfig.jedi_language_server.setup {
  capabilities = capabilities,
  on_attach = function(client, _)
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.implementationProvider = false
  end,
}

lspconfig.pylsp.setup {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },
        flake8 = { enabled = false },
        pylint = { enabled = false },
        pydocstyle = { enabled = false },
        mypy = { enabled = false },
        ruff = { enabled = false },

        autopep8 = { enabled = false },
        yapf = { enabled = false },
        black = { enabled = false },
        isort = { enabled = false },

        jedi_completion = { enabled = false },
        jedi_hover = { enabled = false },
        jedi_signature_help = { enabled = false },
      }
    }
  }
}

lspconfig.ruff_lsp.setup {
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {
        "--select=C90,C4,DTZ,EM,FA,LOG,PTH,ASYNC,G,E,W,F,I,S,N,RUF,TD",
        "--ignore=E722,ERA,N818,UP040,TD003,TD002,UP017",
		"--line-length=120",
		"--respect-gitignore",
      	"--target-version=py312",
        "--fix"
      },
    }
  }
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
  capabilities = capabilities
}
local cfg = require'go.lsp'.config()
lspconfig.gopls.setup(cfg)

-- lspconfig.gopls.setup {
--     capabilities = capabilities,
--     cmd = {"gopls"},
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- }

-- lspconfig.golangci_lint_ls.setup {
--     capabilities = capabilities,
--     filetypes = {'go','gomod'},
--     cmd = {'golangci-lint-langserver'},
--     root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
-- 	init_options = {
-- 		command = {
--             "/home/kegszool/go/bin/golangci-lint",
--             "run",
--             "--out-format",
--             "json",
--             "--show-stats=false",
--             "--issues-exit-code=1",
--         }
-- 	},
-- }

lspconfig.jsonls.setup {
    capabilities = capabilities,
}

lspconfig.jinja_lsp.setup {
  capabilities = capabilities,
  filetypes = { 'jinja', 'salt' },
}
