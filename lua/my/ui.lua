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
        setup_nvim_tree()
        setup_bufferline()
        setup_lualine()
    end,
}
