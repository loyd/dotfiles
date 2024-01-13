local telescope = require("telescope")
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")
local nmap = require("helpers.map").nmap
local partial = require("helpers.func").partial

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
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob **/" }),
                },
            },
        },
    },
})

telescope.load_extension("live_grep_args")
telescope.load_extension("fzf")

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
nmap("<leader>R", builtin.resume, "Resume the last list picker")
nmap("<leader>lk", builtin.keymaps, "List keymaps")

nmap("<leader>f", find_files, "List files")
nmap("<leader>/", live_grep, "List lines filtered by live grep")
nmap("<leader>*", word_under_cursor, "List lines filtered by the word under the cursor")
-- TODO: vmap("<leader>*", selection)

nmap("<leader>ll", builtin.loclist, "List the loclist")
nmap("<leader>lq", builtin.quickfix, "List the quickfix")
nmap(
    "<leader>lw",
    partial(builtin.diagnostics, {
        -- Show diagnostics for the current project only.
        root_dir = true,
        severity_limit = vim.diagnostic.severity.WARN,
    }),
    "List diagnostics with severity WARN and ERROR"
)
nmap(
    "<leader>le",
    partial(builtin.diagnostics, {
        -- Show diagnostics for the current project only.
        root_dir = true,
        severity_limit = vim.diagnostic.severity.ERROR,
    }),
    "List diagnostics with severity ERROR"
)

nmap("<leader>lc", builtin.git_bcommits, "List commits for the current buffer")
nmap("<leader>lC", builtin.git_commits, "List commits for the current project")
nmap("<leader>lb", builtin.git_branches, "List branches for the current project")

nmap("<leader>lr", builtin.lsp_references, "List references for the symbol under the cursor")
nmap("<leader>ls", builtin.lsp_document_symbols, "List symbols for the current buffer")
nmap("<leader>lS", builtin.lsp_workspace_symbols, "List symbols for the current project")
nmap("<leader>li", builtin.lsp_implementations, "List implementations for the symbol under the cursor")
nmap("<leader>ld", builtin.lsp_definitions, "List definitions for the symbol under the cursor")
nmap("<leader>lt", builtin.lsp_type_definitions, "List type definitions for the symbol under the cursor")
