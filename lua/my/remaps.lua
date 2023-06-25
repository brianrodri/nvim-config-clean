local M = {}

M.setup = function()
    vim.g.mapleader = " "

    M.remap_buffer_actions()
    M.remap_clipboard_actions()
    M.remap_file_actions()
    M.remap_git_actions()
    M.remap_nvim_tree_actions()
    M.remap_packer_actions()
    M.remap_telescope_actions()
    M.remap_window_actions()
end

M.set_lsp_mappings = function(opts)
    vim.bo[opts.buffer].omnifunc = "v:lua.vim.lsp.omnifunc"
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

    M.remap_telescope_lsp_actions(opts)
end

M.remap_clipboard_actions = function()
    vim.keymap.set("v", "<leader>y", '"+y')
    vim.keymap.set("n", "<leader>y", '"+y')
    vim.keymap.set("v", "<leader>Y", '"+y$')
    vim.keymap.set("n", "<leader>Y", '"+y$')
    vim.keymap.set("v", "<leader>d", '"+d')
    vim.keymap.set("n", "<leader>d", '"+d')
    vim.keymap.set("v", "<leader>D", '"+D')
    vim.keymap.set("n", "<leader>D", '"+D')
    vim.keymap.set("n", "<leader>p", '"+p')
    vim.keymap.set("v", "<leader>p", '"+p')
    vim.keymap.set("n", "<leader>P", '"+P')
    vim.keymap.set("v", "<leader>P", '"+P')
    vim.keymap.set("n", "<leader>%", ':let @"=@%<CR>')
end

M.remap_buffer_actions = function()
    vim.keymap.set("n", "[b", vim.cmd.bN)
    vim.keymap.set("n", "]b", vim.cmd.bn)
end

M.remap_file_actions = function()
    vim.keymap.set("n", "<leader>X", ":q!<CR>")
    vim.keymap.set("n", "<leader>e", ":e! %<CR>")
    vim.keymap.set("n", "<leader>w", ":w<CR>")
    vim.keymap.set("n", "<leader><C-w>", ":w | source %<CR>")
    vim.keymap.set("n", "<leader>x", ":bdelete!<CR>")
    vim.keymap.set("n", "ZA", ":qa!<CR>")
end

M.remap_git_actions = function()
    vim.keymap.set("n", "gK", vim.cmd.GitGutterPreviewHunk)
end

M.remap_nvim_tree_actions = function()
    vim.keymap.set("n", "<leader>T", vim.cmd.NvimTreeFocus)
end

M.remap_packer_actions = function()
    vim.keymap.set("n", "<leader><C-U>", vim.cmd.PackerSync)
end

M.remap_telescope_actions = function()
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
    vim.keymap.set("n", "<leader>f/", telescope_builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
    vim.keymap.set("n", "<leader>fv", telescope_builtin.lsp_references, {})
end

M.remap_telescope_lsp_actions = function(opts)
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fv", telescope_builtin.lsp_document_symbols, opts)
end

M.remap_window_actions = function()
    vim.keymap.set("n", "<leader><C-h>", ":leftabove vsplit<CR>")
    vim.keymap.set("n", "<leader><C-j>", ":rightbelow split<CR>")
    vim.keymap.set("n", "<leader><C-k>", ":leftabove split<CR>")
    vim.keymap.set("n", "<leader><C-l>", ":rightbelow vsplit<CR>")
end

return M
