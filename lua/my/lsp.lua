local M = {}

function M.setup_lsp()
    local lsp = require("lsp-zero").preset("recommended")
    lsp.on_attach(function(...) M.on_attach(lsp, ...) end)
    M.setup_lua_lsp()
    lsp.setup()
end

function M.setup_lua_lsp()
    require("neodev").setup({})
end

function M.setup_cmp()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
        window = {
            documentation = cmp.config.window.bordered(),
            completion = cmp.config.window.bordered(),
        },
        mapping = {
            ['<CR>'] = cmp.mapping.confirm { select = false },
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp_action.luasnip_supertab(),
            ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        }
    })
end

function M.on_attach(lsp, _, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps(opts)
    require("my.remaps").set_lsp_mappings(opts)
end

function M.setup()
    M.setup_lsp()
    M.setup_cmp()
end

return M
