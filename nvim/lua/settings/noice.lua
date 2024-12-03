local nmap = require("helpers.map").nmap

-- NOTE: `vim.opt.shortmess` affects these patterns.
local suppressed = {
    { find = "%d+L, %d+B written$" }, -- save
    { find = "^%d+ fewer lines?" }, -- delete
    { find = "^%d+ more lines?" }, -- paste
    { find = "^%d+ lines yanked$" },
    { find = "; before #%d+" }, -- undo
    { find = "; after #%d+" }, -- redo
    { find = "%d+ lines to indent" }, -- indent
    { find = "%d+ lines indented" }, -- indent
    { find = "^[/?].*" }, -- search
    { find = "^Already at oldest change$" }, -- undo
    { find = "^Already at newest change$" }, -- redo
    { find = "^Hunk %d+ of %d+$" },
    { find = "no lines in buffer" },
}

require("noice").setup({
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                any = suppressed,
            },
            opts = { skip = true },
        },
        -- WA for https://github.com/rust-lang/rust-analyzer/issues/17289
        {
            filter = {
                event = "notify",
                error = true,
                find = "-32%d+: ",
            },
            opts = { skip = true },
        },
    },
})

nmap("<leader>lh", ":Noice fzf<CR>", "List message history")
