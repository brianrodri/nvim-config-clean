local setup_lsp_zero = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr }
        lsp.default_keymaps(opts)
        require("my.remaps").set_lsp_mappings(opts)
    end)

    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
end

local setup_cmp = function()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
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
