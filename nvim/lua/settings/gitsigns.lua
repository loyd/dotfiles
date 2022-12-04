local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap
local omap = require("helpers.map").omap
local xmap = require("helpers.map").xmap

require("gitsigns").setup({
    -- TODO: integrations

    on_attach = function(_bufnr)
        -- Navigation
        nmap("]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        nmap("[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

        -- Actions
        nmap("<leader>hs", ":Gitsigns stage_hunk<CR>")
        vmap("<leader>hs", ":Gitsigns stage_hunk<CR>")
        nmap("<leader>hr", ":Gitsigns reset_hunk<CR>")
        vmap("<leader>hr", ":Gitsigns reset_hunk<CR>")
        nmap("<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
        nmap("<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
        nmap("<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
        nmap("<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
        nmap("<leader>hb", "<cmd>lua require 'gitsigns'.blame_line {full = true}<CR>")
        nmap("<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
        nmap("<leader>hd", "<cmd>Gitsigns diffthis<CR>")
        nmap("<leader>hD", "<cmd>lua require 'gitsigns'.diffthis('~')<CR>")
        nmap("<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

        -- Text object
        omap("ih", ":<C-U>Gitsigns select_hunk<CR>")
        xmap("ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
})
