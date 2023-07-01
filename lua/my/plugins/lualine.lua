local function get_os()
	if vim.fn.has("mac") then
		return ""
	elseif vim.fn.has("win32") or vim.fn.has("win32unix") then
		return ""
	elseif vim.fn.has("unix") then
		return ""
	end
end

require("lualine").setup({
	extensions = { "fugitive", "nvim-tree" },
	sections = {
		lualine_a = { get_os, "FugitiveHead" },
	},
	theme = "gruvbox",
})
