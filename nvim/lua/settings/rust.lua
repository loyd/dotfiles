local nmap = require("helpers.map").nmap

vim.g.rustfmt_command = "rustfmt +nightly"
vim.g.rustfmt_autosave = 1

nmap("<leader>rr", ":RustRunnables<CR>", "List Rust runnables")
nmap("<leader>rd", ":RustDebuggables<CR>", "List Rust debuggables")
nmap("<leader>rm", ":RustExpandMacro<CR>", "Expand Rust macro")
nmap("<leader>rc", ":RustOpenCargo<CR>", "Open Cargo.toml")
nmap("<leader>rp", ":RustParentModule<CR>", "Jump to the parent Rust module")
