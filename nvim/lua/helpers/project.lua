local M = {}

local WORKSPACE_DIR = "/home/workspace"

-- Pattern: `<workspace>/<scope>/<project>`
function M.extract_project_name(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)

    local p = path:match("^diffview://(.+)")
    path = (p or path)

    local scope, project = path:match("^" .. WORKSPACE_DIR .. "/([^/]+)/([^/]+)")
    if scope then
        return "[" .. scope .. "] " .. project
    end
end

return M
