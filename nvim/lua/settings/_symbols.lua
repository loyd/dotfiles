-- Symbols used by multiple plugins.

local M = {}

-- Use the lualine's config as a reference.
M.diagnostics = {
    error = "󰅚",
    warn = "󰀪",
    info = "󰋽",
    hint = "󰌶",
}

-- Mimic git-status and diffview.
M.vcs = {
    unstaged = "M",
    staged = "M",
    unmerged = "U",
    renamed = "R",
    untracked = "?",
    deleted = "D",
    ignored = "!",
}

return M
