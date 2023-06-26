local function get_diff_base()
    local merge_base_branch = os.getenv("MERGE_BASE_BRANCH")
    if merge_base_branch == nil then
        merge_base_branch = vim.fn.system [[
            git rev-parse --git-dir &> /dev/null || return;
            for ref in refs/{heads,remotes/{origin,upstream}}/{mainline,master,develop,trunk}; do
                if command git show-ref -q --verify $ref; then
                    echo ${ref:t};
                    return;
                fi;
            done;
            echo main;
        ]]
    end
    return vim.fn.trim(merge_base_branch)
end

vim.g.gitgutter_diff_base = get_diff_base()
vim.g.gitgutter_floating_window_options = vim.tbl_extend("force", vim.g.gitgutter_floating_window_options, {
    border = "rounded",
})
