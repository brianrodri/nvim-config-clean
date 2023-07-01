local function get_diff_base()
	local merge_base_branch = os.getenv("MERGE_BASE_BRANCH")
	if merge_base_branch == nil then
		merge_base_branch = vim.fn.system([[
            git rev-parse --git-dir &> /dev/null || return;
            for ref in refs/{heads,remotes/{origin,upstream}}/{mainline,master,develop,trunk}; do
                if command git show-ref -q --verify $ref; then
                    echo ${ref:t};
                    return;
                fi;
            done;
            echo main;
        ]])
	end
	return vim.fn.trim(merge_base_branch)
end

local gitsigns = require("gitsigns")
gitsigns.setup({
	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, opts)
			vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", { buffer = bufnr }, opts))
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			else
				vim.schedule(gitsigns.next_hunk)
				return "<Ignore>"
			end
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			else
				vim.schedule(gitsigns.prev_hunk)
				return "<Ignore>"
			end
		end, { expr = true })
	end,
})
gitsigns.change_base(get_diff_base(), true)
