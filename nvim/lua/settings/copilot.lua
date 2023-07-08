local imap = require("helpers.map").imap

vim.g.copilot_no_tab_map = true

imap("<C-J>", 'copilot#Accept("")', "Complete by Copilot", { expr = true })
