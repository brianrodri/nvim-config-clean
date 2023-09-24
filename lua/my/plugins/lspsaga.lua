local my_icons = require("my.icons")

local JUMP_KEYS = "<C-]>"
local NEW_SPLIT_KEYS = "<C-j>"
local NEW_TAB_KEYS = "<C-n>"
local NEW_VSPLIT_KEYS = "<C-l>"
local PRIMARY_ACTION_KEY = "<CR>"
local QUIT_KEYS = { "<C-c>", "<ESC>" }

require("lspsaga").setup({
    callhierarchy = {
        keys = {
            edit = PRIMARY_ACTION_KEY,
            jump = JUMP_KEYS,
            quit = QUIT_KEYS,
            split = NEW_SPLIT_KEYS,
            tabe = NEW_TAB_KEYS,
            vsplit = NEW_VSPLIT_KEYS,
        },
    },
    code_action = {
        keys = {
            quit = QUIT_KEYS,
        },
        show_server_name = true,
    },
    definition = {
        edit = PRIMARY_ACTION_KEY,
        quit = QUIT_KEYS,
        split = NEW_SPLIT_KEYS,
        tabe = NEW_TAB_KEYS,
        vsplit = NEW_VSPLIT_KEYS,
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
    finder = {
        keys = {
            expand_or_jump = JUMP_KEYS,
            jump_to = PRIMARY_ACTION_KEY,
            quit = QUIT_KEYS,
            split = NEW_SPLIT_KEYS,
            tabe = NEW_TAB_KEYS,
            vsplit = NEW_VSPLIT_KEYS,
        },
    },
    lightbulb = {
        enable = false,
    },
    rename = {
        confirm = PRIMARY_ACTION_KEY,
        exec = PRIMARY_ACTION_KEY,
        in_select = false,
        quit = "<C-c>",
    },
    outline = {
        keys = {
            expand_or_jump = JUMP_KEYS,
            quit = QUIT_KEYS,
        },
    },
    ui = {
        border = "rounded",
        code_action = my_icons.ui.Lightbulb,
        collapse = my_icons.ui.ArrowOpen,
        expand = my_icons.ui.ArrowClosed,
        hover = my_icons.ui.Preview,
        incoming = my_icons.ui.CallIncoming,
        outgoing = my_icons.ui.CallOutgoing,
    },
})
