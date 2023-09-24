local my_icons = require("my.icons")
require("fidget").setup({
    text = {
        commenced = "Pending",
        completed = "Finished",
        done = my_icons.ui.Check,
        spinner = "dots_scrolling",
    },
})
