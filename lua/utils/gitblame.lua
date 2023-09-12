local M = {}
local api = vim.api
function M.blameVirtText()
    local ft = vim.fn.expand("%:h:t") -- get the current file extension
    if ft == "" then -- if we are in a scratch buffer or unknown filetype
        return
    end
    if ft == "bin" then -- if we are in nvim's terminal window
        return
    end
    api.nvim_buf_clear_namespace(0, 2, 0, -1) -- clear out virtual text from namespace 2 (the namespace we will set later)
    local cwd = vim.fn.getcwd()
    local currFile = vim.fn.expand("%")
    local line = api.nvim_win_get_cursor(0)
    local blamecmd = string.format("cd %s && git blame -c -L %d,%d %s", cwd, line[1], line[1], currFile)
    local blame = vim.fn.system(blamecmd)
    local hash = vim.split(blame, "%s")[1]
    print(hash)
    local cmd = string.format("git show %s ", hash) .. "--format='%an | %ar | %s'"
    if hash == "00000000" then
        text = "Not Committed Yet - 1"
    else
        text = vim.fn.system(cmd)
        text = vim.split(text, "\n")[1]
    end
    text = blame
    api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, { { text, "GitLens" } }, {}) -- set virtual text for namespace 2 with the content from git and assign it to the higlight group 'GitLens'
end
function M.clearBlameVirtText() -- important for clearing out the text when our cursor moves
    api.nvim_buf_clear_namespace(0, 2, 0, -1)
end
return M
