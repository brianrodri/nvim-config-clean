local M = {}

function M.setup_plugins(use)
    use "wbthomason/packer.nvim"

    M.setup_colorscheme_plugins(use)
    M.setup_file_plugins(use)
    M.setup_git_plugins(use)
    M.setup_indentation_plugins(use)
    M.setup_lsp_plugins(use)
    M.setup_search_plugins(use)
    M.setup_statusline_plugins(use)
    M.setup_tmux_plugins(use)
    M.setup_window_plugins(use)
end

function M.setup_colorscheme_plugins(use)
    use "eddyekofo94/gruvbox-flat.nvim"
end

function M.setup_file_plugins(use)
    use "nvim-tree/nvim-tree.lua"
end

function M.setup_git_plugins(use)
    use "tpope/vim-fugitive"
    use "airblade/vim-gitgutter"
end

function M.setup_indentation_plugins(use)
    use "nmac427/guess-indent.nvim"
end

function M.setup_lsp_plugins(use)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() pcall(vim.fn.TSUpdate) end,
    }

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    }

    use "folke/neodev.nvim" -- Configures lua_ls
end

function M.setup_search_plugins(use)
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" }
    }
    use "nvim-telescope/telescope-ui-select.nvim"
end

function M.setup_window_plugins(use)
    use { "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }
end

function M.setup_statusline_plugins(use)
    use "nvim-lualine/lualine.nvim"
end

function M.setup_tmux_plugins(use)
    use "aserowy/tmux.nvim"
end

function M.setup()
    local freshly_installed = M.ensure_packer()
    local packer = require("packer")

    packer.startup(function(use)
        M.setup_plugins(use)
        if freshly_installed then packer.sync() end
    end)
end

function M.ensure_packer()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd.packadd("packer.nvim")
        return true
    else
        return false
    end
end

return M
