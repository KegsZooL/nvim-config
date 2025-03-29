local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local fn = vim.fn

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

lspconfig.jdtls.setup({
    capabilities = capabilities,
    settings = {
        java = {
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                    exclusions = { "this" },
                },
            },
        }
    }
})

-- lspconfig.pyright.setup({
--     capabilities = capabilities,
--     settings = {
-- 	    -- pyright = {
--      --        typeCheckingMode = "recommended",
-- 	    -- },
-- 	    python = {
--             analysis = {
--                 stubPath = "~/typing-stubs/",
--                 program = vim.fn.getcwd() .. '/manage.py',
--                 extraPaths = { "./manage.py", "./" },
--                 reportUnusedImport = false,
--             },
-- 		},
-- 	},
-- })

lspconfig.basedpyright.setup({
  capabilities = capabilities,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",  -- "off", "basic", "standard", "strict", "recommended", "all"
        diagnosticMode = "workspace",
        stubPath = fn.expand("~/.pyright/stubs"),
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
        extraPaths = { "./manage.py", "./" },

        diagnosticSeverityOverrides = {
          reportAny = "none",                     -- игнорировать `Any`
          -- reportOptionalMemberAccess = "none",    -- доступ к Optional[...].attr
          -- reportOptionalSubscript = "none",       -- индексация Optional[...][...]
          -- reportOptionalCall = "none",           -- вызов Optional[...]()
          -- reportOptionalIterable = "none",        -- итерация Optional[...]
          -- reportAttributeAccessIssue = "none",    -- доступ к несуществующим атрибутам
          -- reportMissingTypeArgument = "none",     -- отсутствие Generic-типов
          -- reportGeneralTypeIssues = "none",      -- общие проблемы с типами
          -- reportMissingTypeStubs = "none",        -- отсутствие стабов
          -- reportUnknownArgumentType = "none",     -- неизвестный тип аргумента
          -- reportUnknownMemberType = "none",      -- неизвестный тип атрибута
          -- reportUnknownParameterType = "none",   -- неизвестный тип параметра
          -- reportUnknownVariableType = "none",     -- неизвестный тип переменной
          -- reportTypedDictNotRequiredAccess = "none", -- доступ к необязательным полям TypedDict
          -- reportPrivateImportUsage = "none",      -- использование приватных импортов
          -- reportUnusedCallResult = "none",       -- неиспользуемый результат вызова
          reportUnusedImport = "none",           -- неиспользуемые импорты
          reportUnusedVariable = "none",          -- неиспользуемые переменные
          reportUntypedFunctionDecorator = "none", -- декораторы без аннотаций
        },

        inlayHints = {
          variableTypes = false,
          genericTypes = false,
          functionReturnTypes = true,
          callArgumentNames = true,
        },
      },
    },
  },
})

lspconfig.ruff_lsp.setup {
  init_options = {
    settings = {
      args = {
		"--select=E,F,UP,N,I,ASYNC,S,PTH",
		"--line-length=79",
		"--respect-gitignore",
      	"--target-version=py311",
        "--fix"
      },
    }
  }
}

lspconfig.marksman.setup({
   capabilities = capabilities
})

lspconfig.jsonls.setup({
    capabilities = capabilities
})

lspconfig.cssls.setup({
    capabilities = capabilities
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

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
})

lspconfig.svelte.setup({
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                parameterNames = { enabled = 'all' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
            },
        },
    },
})

lspconfig.prismals.setup({
    capabilities = capabilities
})

lspconfig.graphql.setup({
    capabilities = capabilities,
    filetypes = {
        "graphql", "gql",
        "svelte", "typescriptreact",
        "javascriptreact"
    }
})

lspconfig.asm_lsp.setup({
    capabilities = capabilities,
    filetypes = {
        "asm", "vmasm", "s", "S"
    }
})

lspconfig.jinja_lsp.setup({
    capabilities = capabilities,
})

require("lsp_signature").setup({
    bind = true,
    hint_enable = false,
    floating_window = false,
})
