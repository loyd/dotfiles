local gitsigns = require("gitsigns")
local map = require("helpers.map").map
local nmap = require("helpers.map").nmap
local partial = require("helpers.func").partial

-- TODO: integrations
gitsigns.setup({})

-- Actions
nmap("<leader>hn", gitsigns.next_hunk, "Jump to the next hunk")
nmap("<leader>hp", gitsigns.prev_hunk, "Jump to the previous hunk")
map({ "n", "v" }, "<leader>hs", gitsigns.stage_hunk, "Stage the hunk at the cursor")
map({ "n", "v" }, "<leader>hr", gitsigns.reset_hunk, "Reset the hunk at the cursor")
nmap("<leader>hS", gitsigns.stage_buffer, "Stage the whole buffer")
nmap("<leader>hu", gitsigns.undo_stage_hunk, "Undo the last hunk staging")
nmap("<leader>hR", gitsigns.reset_buffer, "Reset the whole buffer")
nmap("<leader>ph", gitsigns.preview_hunk, "Preview the hunk at the cursor")
nmap("<leader>pb", partial(gitsigns.blame_line, { full = true }), "Preview the git blame for the current line")
nmap("<leader>tb", gitsigns.toggle_current_line_blame, "Toggle the git blame for the current line")
nmap("<leader>td", gitsigns.toggle_deleted, "Toggle the deleted lines")

-- Text object
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select the current hunk")
