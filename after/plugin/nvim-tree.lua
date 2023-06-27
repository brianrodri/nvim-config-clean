local my_icons = require("my.icons")
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	-- BEGIN_DEFAULT_OPTS
	disable_netrw = true,
	renderer = {
		group_empty = true,
		highlight_git = true,
		indent_width = 4,
		icons = {
			webdev_colors = true,
			symlink_arrow = my_icons.shapes.ArrowSmallRight,
			glyphs = {
				bookmark = my_icons.ui.BookMark,
				modified = my_icons.ui.Pencil,
				folder = {
					arrow_closed = my_icons.ui.ArrowClosed,
					arrow_open = my_icons.ui.ArrowOpen,
				},
				git = {
					unstaged = my_icons.git.Mod,
					staged = my_icons.git.Add,
					unmerged = my_icons.git.Branch,
					renamed = my_icons.git.Rename,
					untracked = my_icons.git.PullRequestDraft,
					deleted = my_icons.git.Remove,
					ignored = my_icons.git.Ignore,
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		severity = { min = vim.diagnostic.severity.ERROR },
		icons = {
			hint = my_icons.diagnostics.Hint,
			info = my_icons.diagnostics.Information,
			warning = my_icons.diagnostics.Warning,
			error = my_icons.diagnostics.Error,
		},
	},
	filters = { dotfiles = true },
	git = { ignore = false },
	live_filter = { prefix = my_icons.ui.Filter .. ": " },
	experimental = {},
})
