local nmap = require("helpers.map").nmap
local augroup = require("helpers.augroup")
local default_branch = require("helpers.git").default_branch

nmap("<leader>go", ":DiffviewOpen<CR>", "Diffview: compare against HEAD")
-- https://github.com/sindrets/diffview.nvim/issues/316
nmap("<leader>gq", ":tabn # | tabc #<CR>", "Diffview: close the active view")
nmap("<leader>gH", ":DiffviewFileHistory<CR>", "Diffview: show history of the working tree")
nmap("<leader>gh", ":DiffviewFileHistory --follow %<CR>", "Diffview: show history of the current file")
nmap("<leader>gl", ":.DiffviewFileHistory --follow<CR>", "Diffview: show history of the current line")

nmap("<leader>gm", function()
    vim.cmd("DiffviewOpen " .. default_branch())
end, "Diffview: compare against the master")
nmap("<leader>gM", function()
    vim.cmd("DiffviewOpen HEAD..origin/" .. default_branch())
end, "Diffview: compare against the origin/master")

-- Link `DiffviewNormal` to `NvimTreeNormal` to unify background colors.
augroup("DiffviewPanelBg", function(autocmd)
    local function fix_bg()
        vim.api.nvim_set_hl(0, "DiffviewNormal", { link = "NvimTreeNormal" })
    end
    fix_bg()

    autocmd("ColorScheme", {}, fix_bg)
end)
