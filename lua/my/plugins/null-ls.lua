local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.stylua,
	},
})
