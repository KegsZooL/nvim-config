require("toggleterm").setup{
    size = 20,
    open_mapping = [[<c-\>]], -- CTRL+\
    start_in_insert = true,
    autochdir = true,
    shading_factor = 1, -- precentage of terminal highlighting
    direction = "horizontal",
    persist_size = true, -- the size of the new terminal will be equal to the previous
    shade_filetypes = {},
    shade_terminal = true,
    shell = vim.o.shell,
}