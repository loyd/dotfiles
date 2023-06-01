local telescope = require("telescope")
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")
local nmap = require("helpers.map").nmap

telescope.setup({
    defaults = {
        layout_config = {
            horizontal = { preview_width = 105 },
        },
        preview = {
            timeout = 750,
        },
    },
    extensions = {
        live_grep_args = {
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                },
            },
        },
    },
})

telescope.load_extension("live_grep_args")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local cwd_blacklist = {
    ["/"] = true,
    ["/home"] = true,
    ["/home/workspace"] = true,
}

local function bad_cwd()
    local cwd = vim.loop.cwd()
    return cwd_blacklist[cwd]
end

local function find_files()
    if bad_cwd() then
        return
    end
    -- Falling back to find_files if git_files can't find a .git directory.
    local opts = { show_untracked = true }
    local ok = pcall(builtin.git_files, opts)
    if not ok then
        builtin.find_files(opts)
    end
end

local function live_grep()
    if bad_cwd() then
        return
    end
    telescope.extensions.live_grep_args.live_grep_args()
end

local function word_under_cursor()
    if bad_cwd() then
        return
    end
    -- TODO: use `live_grep_args_shortcuts.grep_word_under_cursor`?
    builtin.grep_string({ word_match = "-w" })
end

-- Key bindings.
nmap("<leader>R", ":lua require 'telescope.builtin'.resume()<CR>")

nmap("<leader>f", find_files)
nmap("<leader>/", live_grep)
nmap("<leader>*", word_under_cursor)
-- TODO: vmap("<leader>*", selection)

nmap("<leader>l", ":lua require 'telescope.builtin'.loclist()<CR>")
nmap("<leader>q", ":lua require 'telescope.builtin'.quickfix()<CR>")
nmap("<leader>dw", function()
    builtin.diagnostics({
        -- Show diagnostics for the current project only.
        root_dir = true,
        severity_limit = vim.diagnostic.severity.WARN,
    })
end)
nmap("<leader>de", function()
    builtin.diagnostics({
        -- Show diagnostics for the current project only.
        root_dir = true,
        severity_limit = vim.diagnostic.severity.ERROR,
    })
end)

nmap("<leader>gc", ":lua require 'telescope.builtin'.git_bcommits()<CR>")
nmap("<leader>gC", ":lua require 'telescope.builtin'.git_commits()<CR>")
nmap("<leader>gb", ":lua require 'telescope.builtin'.git_branches()<CR>")
nmap("<leader>gs", ":lua require 'telescope.builtin'.git_status()<CR>")

nmap("<leader>sr", ":lua require 'telescope.builtin'.lsp_references()<CR>")
nmap("<leader>ss", ":lua require 'telescope.builtin'.lsp_document_symbols()<CR>")
nmap("<leader>sS", ":lua require 'telescope.builtin'.lsp_workspace_symbols()<CR>")
nmap("<leader>sa", ":lua require 'telescope.builtin'.lsp_code_actions()<CR>")
nmap("<leader>si", ":lua require 'telescope.builtin'.lsp_implementations()<CR>")
nmap("<leader>sd", ":lua require 'telescope.builtin'.lsp_definitions()<CR>")
nmap("<leader>st", ":lua require 'telescope.builtin'.lsp_type_definitions()<CR>")
