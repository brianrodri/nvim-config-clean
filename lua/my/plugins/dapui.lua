local my_icons = require("my.icons")

require("dapui").setup({
	controls = {
		icons = {
			disconnect = my_icons.debug.DebugDisconnect,
			pause = my_icons.debug.DebugPause,
			play = my_icons.debug.DebugContinue,
			run_last = my_icons.debug.DebugRestart,
			step_back = my_icons.debug.DebugStepBack,
			step_into = my_icons.debug.DebugStepInto,
			step_out = my_icons.debug.DebugStepOut,
			step_over = my_icons.debug.DebugStepOver,
			terminate = my_icons.debug.DebugStop,
		},
	},
	floating = {
		mappings = {
			close = { "<C-c>", "<Esc>" },
		},
	},
	icons = {
		collapsed = my_icons.ui.ArrowClosed,
		current_frame = my_icons.kind.Struct,
		expanded = my_icons.ui.ArrowOpen,
	},
	mappings = {
		edit = "c",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
	},
})
