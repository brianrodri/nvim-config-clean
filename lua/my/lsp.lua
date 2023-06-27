local my_remaps = require("my.remaps")

local function on_attach(client, bufnr)
	local caps = client.server_capabilities

	if caps.semanticTokensProvider then
		vim.lsp.semantic_tokens.start(bufnr, client.id)
	end

	if caps.codeLensProvider then
		pcall(vim.lsp.codelens.refresh)
		vim.api.nvim_create_autocmd("BufWritePost", {
			buffer = bufnr,
			group = vim.api.nvim_create_augroup("codelens_cmds", { clear = true }),
			desc = "Refresh CodeLens",
			callback = function()
				pcall(vim.lsp.codelens.refresh)
			end,
		})
	end

	if client.name == "jdtls" then
		local jdtls = require("jdtls")
		jdtls.setup_dap({ hotcodereplace = "auto" })
		jdtls.setup.add_commands() -- Call after setup_dap to include dap commands.
		my_remaps.on_dap_attach(client, bufnr)
	end

	my_remaps.on_lsp_attach(client, bufnr)
end

local M = {}

function M.setup()
	M.setup_lsp_zero()
	M.setup_cmp()
end

function M.setup_lsp_zero()
	local lsp = require("lsp-zero").preset("recommended")
	lsp.ensure_installed({ "jdtls", "lua_ls" })
	lsp.skip_server_setup({ "jdtls" })
	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
		on_attach(client, bufnr)
	end)

	M.setup_neodev() -- MUST BE SET UP BEFORE LSP-ZERO!

	lsp.setup()
end

function M.setup_neodev()
	require("neodev").setup({
		library = {
			plugins = { "nvim-dap-ui", "lspsaga" },
			types = true,
		},
	})
end

function M.setup_cmp()
	local cmp = require("cmp")
	local cmp_action = require("lsp-zero").cmp_action()

	cmp.setup({
		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<Tab>"] = cmp_action.luasnip_supertab(),
			["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		},
		sources = {
			{ name = "buffer" },
			{ name = "nvim_lsp" },
			{ name = "path" },
		},
		window = {
			documentation = cmp.config.window.bordered(),
			completion = cmp.config.window.bordered(),
		},
	})
end

return M
