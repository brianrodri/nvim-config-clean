local my_icons = require("my.icons")
local my_remaps = require("my.remaps")

local function on_attach(client, bufnr)
    if client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
    end

    if client.server_capabilities.codeLensProvider then
        pcall(vim.lsp.codelens.refresh)
        vim.api.nvim_create_autocmd("BufWritePost", {
            buffer = bufnr,
            group = vim.api.nvim_create_augroup("codelens_cmds", { clear = true }),
            desc = "Refresh CodeLens",
            callback = function() pcall(vim.lsp.codelens.refresh) end,
        })
    end

    if client.name == "jdtls" then
        local jdtls = require("jdtls")
        jdtls.setup.add_commands()
        jdtls.setup_dap { hotcodereplace = "auto" }
        my_remaps.on_dap_attach(client, bufnr)
    end

    my_remaps.on_lsp_attach(client, bufnr)
end

local M = {}

function M.setup()
    M.setup_lsp_zero()
    M.setup_cmp()
    M.setup_lspsaga()
end

function M.setup_lsp_zero()
    local lsp = require("lsp-zero").preset("recommended")
    lsp.ensure_installed { "jdtls", "lua_ls" }
    lsp.skip_server_setup { "jdtls" }
    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps { buffer = bufnr }
        on_attach(client, bufnr)
    end)

    require("neodev").setup { -- MUST BE SET UP BEFORE LSP-ZERO!
        library = {
            plugins = { "nvim-dap-ui", "lspsaga" },
            types = true,
            expand = my_icons.ui.ArrowClosed,
            collapse = my_icons.ui.ArrowOpen,
            code_action = my_icons.ui.Lightbulb,
            incoming = my_icons.ui.CallIncoming,
            outgoing = my_icons.ui.CallOutgoing,
            hover = my_icons.ui.Preview,
            kind = vim.tbl_extend("force", {}, my_icons.kind), -- No hard feelings
        },
    }

    lsp.setup()
end

function M.setup_cmp()
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup {
        mapping = {
            ["<CR>"] = cmp.mapping.confirm { select = false },
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = cmp_action.luasnip_supertab(),
            ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
        },
        window = {
            documentation = cmp.config.window.bordered(),
            completion = cmp.config.window.bordered(),
        },
    }
end

function M.setup_lspsaga()
    require("lspsaga").setup {
        ui = { border = "rounded" },
        rename = { in_select = false },
        lightbulb = { enable = false },
    }
end

return M
