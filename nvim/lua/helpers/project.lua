local M = {}

local CODE_DIR = "/home/code"

-- Pattern: `<code>/<scope>/<project>`
function M.extract_project_name(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)

    local p = path:match("^diffview://(.+)")
    path = (p or path)

    local scope, project = path:match("^" .. CODE_DIR .. "/([^/]+)/([^/]+)")
    if scope then
        return "[" .. scope .. "] " .. project
    end
end

return M
