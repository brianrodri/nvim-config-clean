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
    M.set_lspsaga_mappings(opts)
end

M.set_lspsaga_mappings = function(opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n","gD", "<cmd>Lspsaga goto_definition<CR>", opts)
    vim.keymap.set("n", "gy", "<cmd>Lspsaga peek_type_definition<CR>", opts)
    vim.keymap.set("n","gY", "<cmd>Lspsaga goto_type_definition<CR>", opts)
    vim.keymap.set({"n","v"}, "ga", "<cmd>Lspsaga code_action<CR>", opts)

    vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

    vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "[E", function()
      require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    vim.keymap.set("n", "]E", function()
      require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, opts)

    vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
    vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
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
end

M.remap_window_actions = function()
    vim.keymap.set("n", "<leader><C-h>", ":leftabove vsplit<CR>")
    vim.keymap.set("n", "<leader><C-j>", ":rightbelow split<CR>")
    vim.keymap.set("n", "<leader><C-k>", ":leftabove split<CR>")
    vim.keymap.set("n", "<leader><C-l>", ":rightbelow vsplit<CR>")
end

return M
