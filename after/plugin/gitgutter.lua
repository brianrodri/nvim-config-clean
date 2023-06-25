vim.g.gitgutter_override_sign_column_highlight = 1
vim.g.gitgutter_preview_win_floating = 1
vim.g.gitgutter_floating_window_options = vim.tbl_extend(
    "force",
    vim.g.gitgutter_floating_window_options,
    { border = "rounded" })
