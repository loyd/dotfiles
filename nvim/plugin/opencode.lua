vim.pack.add({ "https://github.com/NickvanDyke/opencode.nvim" })

local oc = require("opencode")
local map = require("helpers.map").map
local partial = require("helpers.func").partial

vim.g.opencode_opts = {}

-- Required for `opts.events.reload`.
vim.o.autoread = true

-- Actions
map({ "n", "x" }, "<leader>oo", partial(oc.ask, "@this: ", { submit = true }), "Ask opencode")
map({ "n", "x" }, "<leader>oa", oc.select, "Execute opencode action")
map({ "n", "x" }, "<leader>om", partial(oc.prompt, "@this"), "Add to opencode")
map({ "n", "t" }, "<leader>to", oc.toggle, "Toggle opencode")

-- TODO
--nmap("<S-C-u>", partial(oc.command, "session.half.page.up"), "Opencode half page up")
--nmap("<S-C-d>", partial(oc.command, "session.half.page.down"), "Opencode half page down")
