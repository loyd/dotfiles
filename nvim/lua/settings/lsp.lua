local nmap = require("helpers.map").nmap
local symbols = require("settings._symbols")

-- https://github.com/simrat39/rust-tools.nvim/issues/196
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("rust-tools").setup({
    server = {
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
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
            },
        },
    },
})

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
nmap("<leader>C", ":CodeActionMenu<CR>", "Show code actions for the symbol under the cursor")

-- TODO: spread on other files? Btw, rust is formatted not by LSP.
vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = false })]])
