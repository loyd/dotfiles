vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- TODO: conflict with autopairs.
        --["<CR>"] = cmp.mapping.confirm({select = false}),
        ["<Tab>"] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "vsnip" },
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    -- TODO: cmp_git
    sources = { { name = "buffer" } },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
    sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ":".
cmp.setup.cmdline(":", {
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})
