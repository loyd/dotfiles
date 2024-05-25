local thunk = require("helpers.func").thunk
local nmap = require("helpers.map").nmap
local augroup = require("helpers.augroup")
local symbols = require("settings._symbols")
local nt_api = require("nvim-tree.api")

-- TODO: diagnostics disappear when switching between tabs.
-- TODO: start on the first file after startup.

require("nvim-tree").setup({
    sync_root_with_cwd = true,
    update_focused_file = { enable = true },
    view = { width = 35 }, -- diffview style
    renderer = {
        root_folder_label = false,
        icons = {
            glyphs = { git = symbols.vcs },
            symlink_arrow = " -> ", -- rely on ligatures
            git_placement = "signcolumn", -- diffview style
            diagnostics_placement = "after",
        },
    },
    git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        severity = {
            min = vim.diagnostic.severity.WARN,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            error = symbols.diagnostics.error,
            warning = symbols.diagnostics.warn,
            info = symbols.diagnostics.info,
            hint = symbols.diagnostics.hint,
        },
    },
    filters = {
        custom = { "^.git$" },
    },
})

-- Start nvim-tree in new tabs.
augroup("NvimTreeNewTab", function(autocmd)
    autocmd("TabNewEntered", {}, thunk(nt_api.tree.open))
end)

nmap("<leader>tt", ":NvimTreeToggle<CR>", "Toggle the file tree")
nmap("<leader>F", ":NvimTreeFocus<CR>", "Focus the file tree")
