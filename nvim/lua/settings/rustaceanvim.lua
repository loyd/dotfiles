local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap

-- TODO: neotest integration?

local ra_settings = {
    cargo = {
        features = "all",
    },
    checkOnSave = {
        command = "clippy",
    },
    imports = {
        granularity = {
            group = "crate",
            -- prefix = "crate",
        },
    },
}

vim.g.rustaceanvim = {
    tools = {
        test_executor = "background",
    },
    server = {
        default_settings = {
            ["rust-analyzer"] = ra_settings,
        },
    },
}

nmap("<leader>rd", ":RustLsp debuggables<CR>", "List Rust debuggables")
nmap("<leader>rr", ":RustLsp runnables<CR>", "List Rust runnables")
nmap("<leader>rt", ":RustLsp testables<CR>", "List Rust testables")
nmap("<leader>rT", ":RustLsp! testables<CR>", "Run the previous Rust testables")
nmap("<leader>rm", ":RustLsp expandMacro<CR>", "Expand Rust macro under the cursor")
nmap("<leader>rc", ":RustLsp openCargo<CR>", "Open Cargo.toml")
nmap("<leader>ro", ":RustLsp openDocs<CR>", "Open docs.rs for the symbol under the cursor")
nmap("<leader>rp", ":RustLsp parentModule<CR>", "Jump to the parent Rust module")
nmap("<leader>rj", ":RustLsp joinLines<CR>", "Join lines starting from the current one")
vmap("<leader>rj", ":RustLsp joinLines<CR>", "Join selected lines")
