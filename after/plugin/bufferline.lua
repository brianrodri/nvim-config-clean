vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		color_icons = true,
		diagnostics = "nvim_lsp",
		separator_style = require("bufferline.constants").sep_names.padded_slant,
		show_buffer_close_icons = false,
		show_buffer_icons = true,
		show_duplicate_prefix = true,
	},
})
