-- Inspired by
-- https://www.reddit.com/r/neovim/comments/zy5s0l/you_dont_need_vimrooter_usually_or_how_to_set_up/

local augroup = require("helpers.augroup")

local root_names = { ".git" }
local root_cache = {}

local set_root = function()
    -- Get directory path to start search from.
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return
    end
    path = vim.fs.dirname(path)

    -- Try cache and resort to searching upward for root directory.
    local root = root_cache[path]
    if root == nil then
        local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
        if root_file == nil then
            return
        end
        root = vim.fs.dirname(root_file)
        root_cache[path] = root
    end

    -- Set the current directory.
    vim.fn.chdir(root)
end

augroup("Rooter", function(autocmd)
    autocmd("BufEnter", {}, set_root)
end)
