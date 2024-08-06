require("emoji").setup({
    ft = "markdown",
    opts = {
        enable_cmp_integration = true, --default is false
    }
})

require("telescope").load_extension("emoji")
