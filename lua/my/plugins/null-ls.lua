local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
    },
})
