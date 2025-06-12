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

lspconfig.pyright.setup {
	settings = {
	    pyright = {
	      -- Using Ruff's import organizer
	      disableOrganizeImports = true,
	    },
	    python = {
	      analysis = {
	            -- Ignore all files for analysis to exclusively use Ruff for linting
	            ignore = { '*' },
	        },
		},
	}
}

lspconfig.ruff_lsp.setup {
  init_options = {
    settings = {
      args = {
		"--select=B,C90,C4,DTZ,EM,UP,FA,LOG,PTH,ASYNC,G,E,F,I,S,W,N,RUF,TD",
        -- "--ignore=E722,ERA,N818,UP040,TD003,TD002,UP017",
		"--line-length=120",
		"--respect-gitignore",
      	"--target-version=py312",
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

lspconfig.gopls.setup {
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
}

require("lsp_signature").setup({
    bind = true,
    hint_enable = false,
    floating_window = false,
    handler_opts = {
        border = "rounded"
    }
})
