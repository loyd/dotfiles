local nmap = require("helpers.map").nmap

nmap("<leader>go", ":DiffviewOpen<CR>")
nmap("<leader>ge", ":DiffviewClose<CR>")
nmap("<leader>gh", ":DiffviewFileHistory %<CR>")
nmap("<leader>gH", ":DiffviewFileHistory<CR>")
