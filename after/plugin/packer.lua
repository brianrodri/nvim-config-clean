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
packer.startup(function(use)
	require("my.packer").setup_plugins(use)
	if freshly_installed then
		packer.sync()
	end
end)
