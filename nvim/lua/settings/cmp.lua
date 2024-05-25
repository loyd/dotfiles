local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    -- preset: C-n (next), C-p (prev), C-y (confirm), C-e (abort)
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = false }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    }, {
        { name = "buffer" },
        { name = "crates" },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            show_labelDetails = true,
        }),
    },
})

cmp.setup.filetype("gitcommit", {
    -- TODO: cmp-git?
    sources = { { name = "buffer" } },
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
})
