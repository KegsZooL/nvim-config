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

lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = {
	    pyright = {
            disableOrganizeImports = true,
            typeCheckingMode = "basic",
            reportUnknownMemberType = true
	    },
	    python = {
            analysis = {
                stubPath = "~/typing-stubs/",
                program = vim.fn.getcwd() .. '/manage.py',
                extraPaths = { "./manage.py", "./" },
                reportUnusedImport = false,
                reportAttributeAccessIssue = false,
                reportGeneralTypeIssues = false,
                ignore = { '*' },
            },
		},
	},
})

-- lspconfig.basedpyright.setup({
--     capabilities = capabilities,
--     settings = {
--       analysis = {
--         typeCheckingMode = "off",
--         diagnosticMode = 'openFilesOnly',
--         stubPath = "~/typing-stubs/",
--         useLibraryCodeForTypes = true,
--         autoSearchPaths = true,
--         extraPaths = { "./manage.py", "./" },
--         diagnosticSeverityOverrides = {
--             reportAny = "none",
--             reportOptionalMemberAccess = 'none',
--             reportOptionalSubscript = 'none',
--             reportOptionalCall = 'none',
--             reportOptionalIterable = 'none',
--             reportAttributeAccessIssue = "none",
--             reportMissingTypeArgument = "none",
--             reportGeneralTypeIssues = "none",
--             reportMissingTypeStubs = "none",
--             reportUnknownArgumentType = "none",
--             reportUnknownMemberType = "none",
--             reportUnknownParameterType = "none",
--             reportUnknownVariableType = "none",
--             reportTypedDictNotRequiredAccess = "none",
--             reportPrivateImportUsage = "none",
--             reportUnusedCallResult = "none",
--             inlayHints = {
--                 variableTypes = false,
--                 genericTypes = false,
--                 functionReturnTypes = true,
--                 callArgumentNames = true,
--             },
--         },
--       },
--     }
-- })

lspconfig.ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
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

lspconfig.matlab_ls.setup({
    capabilities = capabilities,
    settings = {
        MATLAB = {
            indexWorkspace = true,
            installPath = "/opt/matlab/R2023a", -- might need to change this
            matlabConnectionTiming = "onStart",
            telemetry = true,
        },
    },
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
