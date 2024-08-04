require("toggleterm").setup{
    size = 15,
    open_mapping = [[<c-\>]], -- CTRL+\
    start_in_insert = true,
    autochdir = true,
    shading_factor = 1, -- precentage of terminal highlighting
    persist_size = true, -- the size of the new terminal will be equal to the previous
    shade_terminal = true,
    shell = vim.o.shell,
    shade_filetypes = {},
    direction = "float",
    float_opts = {
        border = "double",
    },
}
