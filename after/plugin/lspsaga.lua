local my_icons = require("my.icons")

local PRIMARY_ACTION_KEY = "<CR>"
local QUIT_KEYS = { "<ESC>", "<C-c>" }
local SPLIT_KEYS = "<C-j>"
local VSPLIT_KEYS = "<C-l>"
local JUMP_KEYS = "<C-]>"
local TABE_KEYS = "<C-n>"

require("lspsaga").setup({
	ui = {
		border = "rounded",
		expand = my_icons.ui.ArrowClosed,
		collapse = my_icons.ui.ArrowOpen,
		code_action = my_icons.ui.Lightbulb,
		incoming = my_icons.ui.CallIncoming,
		outgoing = my_icons.ui.CallOutgoing,
		hover = my_icons.ui.Preview,
	},
	finder = {
		keys = {
			jump_to = PRIMARY_ACTION_KEY,
			expand_or_jump = JUMP_KEYS,
			vsplit = VSPLIT_KEYS,
			split = SPLIT_KEYS,
			tabe = TABE_KEYS,
			quit = QUIT_KEYS,
		},
	},
	definition = {
		edit = PRIMARY_ACTION_KEY,
		vsplit = VSPLIT_KEYS,
		split = SPLIT_KEYS,
		tabe = TABE_KEYS,
		quit = QUIT_KEYS,
	},
	code_action = {
		show_server_name = true,
		keys = {
			quit = QUIT_KEYS,
		},
	},
	lightbulb = {
		enable = false,
	},
	diagnostic = {
		extend_relatedInformation = true,
		keys = {
			exec_action = PRIMARY_ACTION_KEY,
			expand_or_jump = JUMP_KEYS,
			quit = QUIT_KEYS,
			quit_in_show = QUIT_KEYS,
		},
	},
	rename = {
		in_select = false,
		exec = PRIMARY_ACTION_KEY,
		confirm = PRIMARY_ACTION_KEY,
		quit = QUIT_KEYS,
	},
	outline = {
		keys = {
			expand_or_jump = JUMP_KEYS,
			quit = QUIT_KEYS,
		},
	},
	callhierarchy = {
		keys = {
			edit = PRIMARY_ACTION_KEY,
			vsplit = VSPLIT_KEYS,
			split = SPLIT_KEYS,
			tabe = TABE_KEYS,
			jump = JUMP_KEYS,
			quit = QUIT_KEYS,
		},
	},
})
