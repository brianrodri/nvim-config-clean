local M = {}

function M.setup()
    M.setup_clipboard()
    M.setup_cursor()
    M.setup_diagnostics_signs()
    M.setup_indents()
    M.setup_updatetime()
    M.setup_rulers()
    M.setup_wrap()
end

function M.setup_diagnostics_signs()
    local my_icons = require("my.icons")
    local signs = {
        Error = my_icons.diagnostics.Error,
        Hint = my_icons.diagnostics.Hint,
        Info = my_icons.diagnostics.Information,
        Warn = my_icons.diagnostics.Warning,
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

function M.setup_clipboard()
    if vim.fn.has("unnamedplus") then
        vim.opt.clipboard = "unnamedplus"
    else
        vim.opt.clipboard = "unnamed"
    end
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

function M.setup_updatetime()
    vim.opt.updatetime = 100
end

function M.setup_rulers()
    vim.opt.number = true
end

function M.setup_wrap()
    vim.opt.textwidth = 120
    vim.opt.wrap = false
end

return M
