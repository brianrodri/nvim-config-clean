local function setup_gruvbox_flat()
    vim.opt.termguicolors = true
    vim.g.gruvbox_sidebars = { "qf", "terminal", "packer" }
    vim.g.gruvbox_dark_float = true
    vim.g.gruvbox_flat_style = "dark"
    -- vim.g.gruvbox_colors = { define = "red" }
    vim.cmd.colorscheme("gruvbox-flat")
end

local function setup_bufferline()
    require("bufferline").setup {
        options = {
            color_icons = true,
            diagnostics = "nvim_lsp",
            separator_style = "padded_slant",
            show_buffer_close_icons = false,
            show_buffer_icons = true,
            show_duplicate_prefix = true,
        },
    }
end

local function setup_gitgutter()
    vim.g.gitgutter_override_sign_column_highlight=1
    vim.g.gitgutter_preview_win_floating = 1
    -- vim.g.gitgutter_floating_window_options["border"] = "shadow"
end

local function setup_lualine()
    require("lualine").setup {
        theme = "gruvbox-flat",
        extensions = { "nvim-tree" },
    }
end

local function setup_nvim_tree()
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
end

return {
    setup = function()
        setup_gruvbox_flat()
        setup_gitgutter()
        setup_nvim_tree()
        setup_bufferline()
        setup_lualine()
    end,
}
