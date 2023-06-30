local my_icons = require("my.icons")

local M = {}

function M.setup_plugins(use)
	use("wbthomason/packer.nvim")

	M.setup_buffer_plugins(use)
	M.setup_colorscheme_plugins(use)
	M.setup_dap_plugins(use)
	M.setup_file_plugins(use)
	M.setup_git_plugins(use)
	M.setup_indentation_plugins(use)
	M.setup_lsp_plugins(use)
	M.setup_motion_plugins(use)
	M.setup_search_plugins(use)
	M.setup_statusline_plugins(use)
	M.setup_syntax_plugins(use)
	M.setup_tmux_plugins(use)
end

function M.setup_buffer_plugins(use)
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
end

function M.setup_colorscheme_plugins(use)
	use("morhetz/gruvbox")
	use("folke/lsp-colors.nvim")
end

function M.setup_dap_plugins(use)
	use("mfussenegger/nvim-dap")

	use({
		"rcarriga/nvim-dap-ui",
		disable = true, -- NOT READY YET
		requires = { "mfussenegger/nvim-dap" },
		config = function() require("my.plugins.dapui") end,
	})

	use({
		"mfussenegger/nvim-dap-python",
		requires = { "mfussenegger/nvim-dap" },
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
		config = function() require("my.plugins.nvim-dap-virtual-text") end,
	})
end

function M.setup_file_plugins(use)
	use("nvim-tree/nvim-tree.lua")
end

function M.setup_git_plugins(use)
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
end

function M.setup_indentation_plugins(use)
	use("nmac427/guess-indent.nvim")
end

function M.setup_lsp_plugins(use)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(vim.fn.TSUpdate)
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	})

	use("jose-elias-alvarez/null-ls.nvim")

	use("folke/neodev.nvim")
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			signs = {
				error = my_icons.diagnostics.Error,
				warning = my_icons.diagnostics.Warning,
				hint = my_icons.diagnostics.Hint,
				information = my_icons.diagnostics.Information,
			},
		},
	})
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use({ "j-hui/fidget.nvim", tag = "legacy" })
	use({ "mfussenegger/nvim-jdtls" })
	use({ "rcarriga/cmp-dap" })
end

function M.setup_motion_plugins(use)
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
end

function M.setup_search_plugins(use)
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" },
	})
	use("gbrlsnchs/telescope-lsp-handlers.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
end

function M.setup_register_plugins(use)
	use("andymass/vim-visput")
end

function M.setup_statusline_plugins(use)
	use("nvim-lualine/lualine.nvim")
end

function M.setup_syntax_plugins(use)
	use("MaxMEllon/vim-jsx-pretty")
end

function M.setup_tmux_plugins(use)
	use("aserowy/tmux.nvim")
end

return M
