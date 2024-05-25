local nmap = require("helpers.map").nmap
local augroup = require("helpers.augroup")

nmap("<leader>go", ":DiffviewOpen<CR>", "Diffview: compare against the index")
nmap("<leader>gM", ":DiffviewOpen master<CR>", "Diffview: compare against the master")
-- https://github.com/sindrets/diffview.nvim/issues/316
nmap("<leader>gq", ":tabn # | tabc #<CR>", "Diffview: close the active view")
nmap("<leader>gh", ":DiffviewFileHistory %<CR>", "Diffview: show history of the current file")
nmap("<leader>gH", ":DiffviewFileHistory<CR>", "Diffview: show history of the working tree")

-- Link `DiffviewNormal` to `NvimTreeNormal` to unify background colors.
augroup("DiffviewPanelBg", function(autocmd)
    local function fix_bg()
        vim.api.nvim_set_hl(0, "DiffviewNormal", { link = "NvimTreeNormal" })
    end
    fix_bg()

    autocmd("ColorScheme", {}, fix_bg)
end)
