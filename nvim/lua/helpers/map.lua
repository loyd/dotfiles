local M = {}
M.funcs = {}

local function map(mode, key, action, opts)
    opts = opts or {}
    if opts.noremap == nil then
        opts.noremap = true
    end
    if opts.silent == nil then
        opts.silent = true
    end

    if type(action) == "function" then
        table.insert(M.funcs, action)
        action = ':lua require "helpers.map".funcs[' .. #M.funcs .. "]()<CR>"
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
