local function setup_cursor()
    vim.opt.cursorline = true
    vim.opt.guicursor = ""
end

local function setup_indents()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
end

local function setup_rulers()
    vim.opt.number = true
end

local function setup_wrap()
    vim.opt.textwidth = 120
    vim.opt.wrap = false
end

return {
    setup = function()
        setup_cursor()
        setup_indents()
        setup_rulers()
        setup_wrap()
    end,
}
