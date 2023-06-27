local my_icons = require("my.icons")
require("fidget").setup({
	text = {
		spinner = "dots_scrolling",
		done = my_icons.ui.Check,
		commenced = "Pending",
		completed = "Finished",
	},
})
