local setup_packer = function(use)
    -- Manage packer with packer.
    use { "wbthomason/packer.nvim" }

    -- Gruvbox colorscheme
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            vim.opt.termguicolors = true
            vim.opt.background = "dark"
            require("gruvbox").setup { contrast = "hard" }
            vim.cmd.colorscheme("gruvbox")
        end,
    }

    -- Auto-detect indentation style from file
    use {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end,
    }

    -- Intuitive tree explorer
    use {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    }

    -- Tmux/vim window interactions
    use {
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end,
    }

    -- Enhance syntax tree of neovim (depended on by most plugins)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() pcall(vim.fn.TSUpdate) end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "java", "javascript", "lua", "python", "typescript" },
            }
        end,
    }

    -- Intuitive LSP resolver
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},             -- Required
            {"williamboman/mason.nvim", run = function() pcall(vim.cmd, "MasonUpdate") end}, -- Required
            {"williamboman/mason-lspconfig.nvim"}, -- Optional
            -- Autocompletion
            {"hrsh7th/nvim-cmp"},     -- Required
            {"hrsh7th/cmp-nvim-lsp"}, -- Required
            {"L3MON4D3/LuaSnip"},     -- Required
        },
        config = function() require("my.lsp-zero").setup() end,
    }

    -- Intuitive FZF experience
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "nvim-tree/nvim-web-devicons" }
    }

    -- Perfect lua/vim LSP
    use { "folke/neodev.nvim" }

    -- Pretty IDE-like buffer tabs
    use {
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup {
                options = {
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    separator_style = require("bufferline.constants").sep_names.slant,
                    show_buffer_close_icons = false,
                    show_buffer_icons = true,
                    show_duplicate_prefix = true,
                },
            }
        end,
    }

    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {
                theme = "gruvbox_dark",
                extensions = { "nvim-tree" },
            }
        end,
    }
end

local ensure_packer = function()
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
            setup_packer(use)
            if freshly_installed then packer.sync() end
        end)
    end,
}
