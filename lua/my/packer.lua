local M = {}

function M.setup_packer(use)
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
    -- Gruvbox colorscheme
    use { "eddyekofo94/gruvbox-flat.nvim" }
end

function M.setup_file_plugins(use)
    -- Intuitive tree explorer
    use { "nvim-tree/nvim-tree.lua" }
end

function M.setup_git_plugins(use)
    -- Perfect Git plugin
    use { "tpope/vim-fugitive" }

    -- Git gutter
    use { "airblade/vim-gitgutter" }
end

function M.setup_indentation_plugins(use)
    -- Auto-detect indentation style from file
    use {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end,
    }
end

function M.setup_lsp_plugins(use)
    -- Enhance syntax tree of neovim (depended on by most plugins)
    use { "nvim-treesitter/nvim-treesitter", run = function() pcall(vim.fn.TSUpdate) end }

    -- Intuitive LSP resolver
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim", run = function() pcall(vim.cmd.MasonUpdate) end}, -- Required
            {"williamboman/mason-lspconfig.nvim"}, -- Optional
            -- Autocompletion
            {"hrsh7th/nvim-cmp"},     -- Required
            {"hrsh7th/cmp-nvim-lsp"}, -- Required
            {"L3MON4D3/LuaSnip"},     -- Required
        },
    }

    -- Perfect lua/vim LSP
    use { "folke/neodev.nvim" }
end

function M.setup_search_plugins(use)
    -- Intuitive FZF experience
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" }
    }
end

function M.setup_window_plugins(use)
    -- Pretty IDE-like buffer tabs
    use { "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }
end

function M.setup_statusline_plugins(use)
    -- Pretty status line
    use { "nvim-lualine/lualine.nvim" }
end

function M.setup_tmux_plugins(use)
    -- Tmux/vim window interactions
    use {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end,
    }
end

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

return {
    setup = function()
        local freshly_installed = ensure_packer()
        local packer = require("packer")

        packer.startup(function(use)
            M.setup_packer(use)
            if freshly_installed then packer.sync() end
        end)
    end
}
