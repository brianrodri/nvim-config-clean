local function on_attach(lsp, _, bufnr)
    local opts = { buffer = bufnr }
    lsp.default_keymaps(opts)
    require("my.remaps").set_lsp_mappings(opts)
end

local function setup_lsp_zero()
    local lsp = require("lsp-zero").preset("recommended")
    lsp.on_attach(function(...) on_attach(lsp, ...) end)
    require("neodev").setup({})
    lsp.setup()
end

local function setup_cmp()
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

return {
    setup = function()
        setup_lsp_zero()
        setup_cmp()
    end,
}
