local M = {}

M.setup = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr }
        lsp.default_keymaps(opts)
        require("my.remaps").set_lsp_mappings(opts)
    end)

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
end

return M
