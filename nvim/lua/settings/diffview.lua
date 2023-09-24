local nmap = require("helpers.map").nmap

-- TODO: make colors close to nvim-tree.

nmap("<leader>go", ":DiffviewOpen<CR>", "Diffview: compare against the index")
nmap("<leader>gM", ":DiffviewOpen master<CR>", "Diffview: compare against the master")
-- https://github.com/sindrets/diffview.nvim/issues/316
nmap("<leader>gq", ":tabn # | tabc #<CR>", "Diffview: close the active view")
nmap("<leader>gh", ":DiffviewFileHistory %<CR>", "Diffview: show history of the current file")
nmap("<leader>gH", ":DiffviewFileHistory<CR>", "Diffview: show history of the working tree")
