local ensure_packer = function()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd.packadd("packer.nvim")
        return true
    end
    return false
end

local bootstrapping = ensure_packer()
local packer = require("packer")

return packer.startup(function(use)
    -- Manage packer with packer.
    use { "wbthomason/packer.nvim" }

    -- Gruvbox colorscheme.
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup { contrast = "hard" }
            vim.o.background = "dark"
            vim.cmd.colorscheme("gruvbox")
        end,
    }

    -- Auto-detect indentation style from file.
    use {
        "nmac427/guess-indent.nvim",
        config = function() require("guess-indent").setup {} end
    }

    -- Enhance syntax tree of neovim (depended on by most plugins)
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() pcall(vim.fn.TSUpdate) end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "java", "javascript", "lua", "python", "typescript" },
            }
        end
    }

    -- Automatically set up from the configuration after cloning packer.nvim.
    -- Keep this at the end after all plugins.
    if bootstrapping then packer.sync() end
end)
