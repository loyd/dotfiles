local goto_preview = require("goto-preview")
local nmap = require("helpers.map").nmap

goto_preview.setup({
    preview_window_title = { enable = true, position = "right" },
})

nmap("<leader>pd", goto_preview.goto_preview_definition, "Preview LSP definition")
nmap("<leader>pt", goto_preview.goto_preview_type_definition, "Preview LSP type definition")
nmap("<leader>pi", goto_preview.goto_preview_implementation, "Preview LSP implementations")
nmap("<leader>pr", goto_preview.goto_preview_references, "Preview LSP references")
nmap("<leader>pq", goto_preview.close_all_win, "Close all preview windows")
