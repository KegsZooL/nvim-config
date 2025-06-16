local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local util = lspconfig.util
local path = util.path

local function get_python_path()
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

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

-- lspconfig.pyright.setup {
--     capabilities = capabilities,
-- 	settings = {
-- 	    pyright = {
-- 	      -- Using Ruff's import organizer
-- 	      disableOrganizeImports = true,
-- 	    },
-- 	    python = {
-- 	      analysis = {
--               autoSearchPaths =  true,
--               useLibraryCodeForTypes = true
-- 	        },
-- 		},
-- 	}
-- }

lspconfig.basedpyright.setup({
    capabilities = capabilities,
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                    reportAny = false,
                    reportMissingTypeArgument = false,
                    reportMissingTypeStubs = false,
                    reportUnknownArgumentType = false,
                    reportUnknownMemberType = false,
                    reportUnknownParameterType = false,
                    reportUnknownVariableType = false,
                    reportUnusedCallResult = false,
                },
            },
        },
        python = {},
    },
    before_init = function(_, config)
        local python_path = get_python_path()
        config.settings.python.pythonPath = python_path
        vim.notify(python_path)
    end,
})

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

lspconfig.graphql.setup({
    capabilities = capabilities,
    filetypes = {
        "graphql", "gql",
        "svelte", "typescriptreact",
        "javascriptreact"
    }
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
