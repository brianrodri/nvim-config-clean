local function ensure_packer()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd.packadd("packer.nvim")
		return true
	else
		return false
	end
end

local freshly_installed = ensure_packer()
local packer = require("packer")

vim.api.nvim_create_autocmd("User PackerComplete", {
	group = vim.api.nvim_create_augroup("UserPackerHook", { clear = true }),
	callback = function()
		if freshly_installed then
			packer.sync()
		end
		require("my.options").setup()
		require("my.remaps").setup()
		require("my.lsp").setup()
	end,
})

packer.startup(function(use) require("my.packer").setup_plugins(use) end)
