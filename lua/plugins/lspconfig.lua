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
    capabilities = capabilities
})

lspconfig.marksman.setup({
   capabilities = capabilities
})

lspconfig.jsonls.setup({
    capabilities = capabilities
})

lspconfig.cssls.setup({
    capabilities = capabilities
})

lspconfig.html.setup({
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
    capabilities = capabilities
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

lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = {
        "html", "typescriptreact",
        "javascriptreact", "css",
        "sass", "scss", "less",
        "svelte"
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

require("lsp_signature").setup({
    bind = true,
    hint_enable = false,
    floating_window = false,
})
