local bufferline = require("bufferline")

bufferline.setup {
    options = {
	    offsets = {
		    {
			    filetype = "NvimTree",
				text = "File Tree",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
            },
			},
		diagnostics = "nvim_lsp",
		separator_style = { "", "" },
		modified_icon = "●",
		show_close_icon = true,
		show_buffer_close_icons = true,
	},
}
