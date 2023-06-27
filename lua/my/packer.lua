local M = {}

function M.setup_plugins(use)
    use "wbthomason/packer.nvim"

    M.setup_buffer_plugins(use)
    M.setup_colorscheme_plugins(use)
    M.setup_file_plugins(use)
    M.setup_git_plugins(use)
    M.setup_indentation_plugins(use)
    M.setup_lsp_plugins(use)
    M.setup_motion_plugins(use)
    M.setup_search_plugins(use)
    M.setup_statusline_plugins(use)
    M.setup_tmux_plugins(use)
    M.setup_work_plugins(use)
end

function M.setup_buffer_plugins(use)
    use { "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }
end

function M.setup_colorscheme_plugins(use)
    use "morhetz/gruvbox"
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
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    }

    use "folke/neodev.nvim"

    use { "glepnir/lspsaga.nvim", branch = "main" }

    use { "j-hui/fidget.nvim", tag = "legacy" }
end

function M.setup_motion_plugins(use)
    use "tpope/vim-surround"
    use "tpope/vim-unimpaired"
end

function M.setup_search_plugins(use)
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" }
    }
    use "gbrlsnchs/telescope-lsp-handlers.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"
end

function M.setup_register_plugins(use)
    use "andymass/vim-visput"
end

function M.setup_statusline_plugins(use)
    use "nvim-lualine/lualine.nvim"
end

function M.setup_tmux_plugins(use)
    use "aserowy/tmux.nvim"
end

function M.setup_work_plugins(use)
    local is_work, work = pcall(require, "work")
    if is_work then work.setup_plugins(use) end
end

return M
