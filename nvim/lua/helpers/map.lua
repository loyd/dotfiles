local partial = require("helpers.func").partial

local M = {}

local function get_location()
    -- Find the first location outside this file.
    for level = 3, 6 do
        local caller = debug.getinfo(level, "Sl")
        local source = caller.source:match("^.*/lua/(.+)$") or caller.source

        if caller.currentline > 0 and not source:match("helpers/map.lua$") then
            return source .. ":" .. caller.currentline
        end
    end

    return "unknown location"
end

function M.map(mode, key, action, desc, opts)
    opts = opts or {}
    opts.desc = desc .. " (" .. get_location() .. ")"

    if opts.silent == nil then
        opts.silent = true
    end

    vim.keymap.set(mode, key, action, opts)
end

M.nmap = partial(M.map, "n")
M.vmap = partial(M.map, "v")
M.imap = partial(M.map, "i")
M.cmap = partial(M.map, "c")
M.omap = partial(M.map, "o")
M.xmap = partial(M.map, "x")

return M
