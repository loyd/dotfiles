vim.pack.add({ "https://github.com/NickvanDyke/opencode.nvim" })

local oc = require("opencode")
local map = require("helpers.map").map
local partial = require("helpers.func").partial

vim.g.opencode_opts = {
    -- Don't start the server, only use existing external one.
    server = {
        -- opencode.nvim cannot find instances inside the `fence` sandbox because
        -- it uses the "opencode.*--port" pattern to find them, but the port is exposed by `socat`
        -- TODO: find a better way to discover the port dynamically for sandboxed instances.
        port = 4000,
        start = function() end,
        stop = function() end,
        toggle = function() end,
    },
}

-- Required for `opts.events.reload`.
vim.o.autoread = true

-- Actions
map({ "n", "x" }, "<leader>oo", partial(oc.ask, "@this: ", { submit = true }), "Ask opencode")
map({ "n", "x" }, "<leader>oa", oc.select, "Execute opencode action")
map({ "n", "x" }, "<leader>om", partial(oc.prompt, "@this"), "Add to opencode")
