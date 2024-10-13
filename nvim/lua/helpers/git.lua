local M = {}

-- It was SO IMPORTANT to change the default branch name, innit?
function M.default_branch()
    local cmd = { "git", "rev-parse", "--verify", "master" }
    local res = vim.system(cmd, { capture_output = true }):wait()
    return res.code == 0 and "master" or "main"
end

return M
