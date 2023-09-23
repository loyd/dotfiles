local M = {}
M.funcs = {}

local function get_location(level)
    local caller = debug.getinfo(level, "Sl")
    local source = caller.source:match("^.*/lua/(.+)$") or caller.source
    return source .. ":" .. caller.currentline
end

local function map(mode, key, action, desc, opts)
    opts = opts or {}
    opts.desc = desc .. " (" .. get_location(4) .. ")"

    if opts.silent == nil then
        opts.silent = true
    end

    vim.keymap.set(mode, key, action, opts)
end

M.map = function(...)
    -- Wrap into a function to have `get_location` consistent.
    map(...)
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
M.cmap = function(...)
    map("c", ...)
end
M.omap = function(...)
    map("o", ...)
end
M.xmap = function(...)
    map("x", ...)
end

return M
