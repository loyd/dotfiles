local nmap = require("helpers.map").nmap

vim.g.rustfmt_command = "rustfmt +nightly"
vim.g.rustfmt_autosave = 1

nmap("<leader>rr", ":RustRunnables<CR>")
nmap("<leader>rd", ":RustDebuggables<CR>")
nmap("<leader>rm", ":RustExpandMacro<CR>")
nmap("<leader>rc", ":RustOpenCargo<CR>")
nmap("<leader>rp", ":RustParentModule<CR>")
