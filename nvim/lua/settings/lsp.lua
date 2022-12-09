local navic = require("nvim-navic")
local nmap = require("helpers.map").nmap

-- https://github.com/simrat39/rust-tools.nvim/issues/196
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("rust-tools").setup({
    server = {
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
        end,
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
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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

nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("<leader>sR", ":lua vim.lsp.buf.rename()<CR>")
-- TODO: signature_help?

nmap("<leader>dn", ":lua vim.diagnostic.goto_next()<CR>")
nmap("<leader>dp", ":lua vim.diagnostic.goto_prev()<CR>")
nmap("D", ":lua vim.diagnostic.open_float()<CR>")
nmap("<leader>C", ":CodeActionMenu<CR>")

-- TODO: spread on other files? Btw, rust is formatted not by LSP.
vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.format({ async = false })]])
