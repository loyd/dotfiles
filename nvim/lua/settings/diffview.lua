local nmap = require("helpers.map").nmap

-- TODO: jump to prev tab when closed.
-- TODO: make colors close to nvim-tree.

nmap("<leader>go", ":DiffviewOpen<CR>", "Diffview: compare against the index")
nmap("<leader>gM", ":DiffviewOpen master<CR>", "Diffview: compare against the master")
nmap("<leader>gq", ":DiffviewClose<CR>", "Diffview: close the active view")
nmap("<leader>gh", ":DiffviewFileHistory %<CR>", "Diffview: show history of the current file")
nmap("<leader>gH", ":DiffviewFileHistory<CR>", "Diffview: show history of the working tree")
