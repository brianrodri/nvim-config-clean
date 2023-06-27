local my_icons = require("my.icons")

require("nvim-tree").setup({
	diagnostics = {
		enable = true,
		icons = {
			error = my_icons.diagnostics.Error,
			hint = my_icons.diagnostics.Hint,
			info = my_icons.diagnostics.Information,
			warning = my_icons.diagnostics.Warning,
		},
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	disable_netrw = true,
	filters = { dotfiles = true },
	git = { ignore = false },
	live_filter = { prefix = my_icons.ui.Filter .. ": " },
	renderer = {
		group_empty = true,
		highlight_git = true,
		icons = {
			glyphs = {
				bookmark = my_icons.ui.BookMark,
				folder = {
					arrow_closed = my_icons.ui.ArrowClosed,
					arrow_open = my_icons.ui.ArrowOpen,
				},
				git = {
					deleted = my_icons.git.Remove,
					ignored = my_icons.git.Ignore,
					renamed = my_icons.git.Rename,
					staged = my_icons.git.Add,
					unmerged = my_icons.git.Branch,
					unstaged = my_icons.git.Mod,
					untracked = my_icons.git.PullRequestDraft,
				},
				modified = my_icons.ui.Pencil,
			},
			symlink_arrow = my_icons.shapes.ArrowSmallRight,
			webdev_colors = true,
		},
		indent_width = 4,
	},
	sort_by = "case_sensitive",
})
