local M = {}
M.funcs = {}

local function get_location(level)
    local caller = debug.getinfo(level, "Sl")
    local source = caller.source:match("^.*/lua/(.+)$") or caller.source
    return source .. ":" .. caller.currentline
end

local function map(mode, key, action, opts)
    opts = opts or {}
    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end

    if type(action) == "function" then
        -- Use a caller's location to provide more useful info.
        local loc = get_location(4)
        M.funcs[loc] = action
        action = ':lua require "helpers.map".funcs["' .. loc .. '"]()<CR>'
    end

    -- TODO: move to `vim.keymap.set`
    vim.api.nvim_set_keymap(mode, key, action, opts)
end

M.nmap = function(...)
    map("n", ...)
end
M.vmap = function(...)
    map("v", ...)
end
M.imap = function(...)
    map("i", ...)
end
M.omap = function(...)
    map("o", ...)
end
M.xmap = function(...)
    map("x", ...)
end

return M
