local M = {}

function M.setup()
    M.setup_cursor()
    M.setup_indents()
    M.setup_rulers()
    M.setup_wrap()
end

function M.setup_cursor()
    vim.opt.cursorline = true
    vim.opt.guicursor = ""
end

function M.setup_indents()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
end

function M.setup_rulers()
    vim.opt.number = true
end

function M.setup_wrap()
    vim.opt.textwidth = 120
    vim.opt.wrap = false
end

return M
