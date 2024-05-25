local nmap = require("helpers.map").nmap
local symbols = require("settings._symbols")

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.stylua,
    },
})

-- Icons instead of letters.
local sym = symbols.diagnostics
local signs = { Error = sym.error, Warn = sym.warn, Info = sym.info, Hint = sym.hint }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    underline = {
        severity = { min = "Warn" },
    },
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})

nmap("K", vim.lsp.buf.hover, "Show hover information about the symbol under the cursor")
nmap("<leader>sR", vim.lsp.buf.rename, "Rename the symbol under the cursor")
-- TODO: signature_help?

nmap("<leader>dn", vim.diagnostic.goto_next, "Jump to the next diagnostic")
nmap("<leader>dp", vim.diagnostic.goto_prev, "Jump to the previous diagnostic")
nmap("D", vim.diagnostic.open_float, "Preview the diagnostic under the cursor")

---- Formatting on save

-- Lua
-- TODO: spread on other files
vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = false })]])

-- Rust (actually, it's used by polyglot, not LSP)
vim.g.rustfmt_command = "rustfmt +nightly"
vim.g.rustfmt_autosave = 1
