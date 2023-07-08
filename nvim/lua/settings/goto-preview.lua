local goto_preview = require("goto-preview")
local nmap = require("helpers.map").nmap

goto_preview.setup({})

nmap("<leader>pd", goto_preview.goto_preview_definition, { desc = "Preview LSP definition" })
nmap("<leader>pt", goto_preview.goto_preview_type_definition, { desc = "Preview LSP type definition" })
nmap("<leader>pi", goto_preview.goto_preview_implementation, { desc = "Preview LSP implementations" })
nmap("<leader>pr", goto_preview.goto_preview_references, { desc = "Preview LSP references" })
nmap("<leader>pq", goto_preview.close_all_win, { desc = "Close all preview windows" })
