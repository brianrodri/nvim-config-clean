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
		my_remaps.on_dap_attach(client, bufnr)
	elseif client.name == "jedi_language_server" then
		require("dap-python").setup(
			require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
		)
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
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "buffer" },
		},
		window = {
			documentation = cmp.config.window.bordered(),
			completion = cmp.config.window.bordered(),
		},
	})

	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		enabled = function()
			return require("cmp_dap").is_dap_buffer()
		end,
		sources = {
			{ name = "dap" },
		},
	})

	cmp.setup.filetype("gitcommit", {
		sources = {
			cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "buffer" },
			}),
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
			{ name = "path" },
		},
	})
end

return M
