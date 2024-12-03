local fzf = require("fzf-lua")
local actions = require("fzf-lua.actions")
local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap
local partial = require("helpers.func").partial

fzf.setup({
    winopts = {
        backdrop = 80,
    },
    previewers = {
        ["custom:project"] = {
            cmd = [[s() {
                git -C $1 -c color.ui=always status
                echo
                git -C $1 -c color.ui=always last
            }; s]],
            _ctor = require("fzf-lua.previewer").fzf.cmd,
        },
    },
    keymap = {
        builtin = {
            false,
            ["<F1>"] = "toggle-help",
            ["<F2>"] = "toggle-fullscreen",
            ["<F3>"] = "toggle-preview-wrap",
            ["<F4>"] = "toggle-preview",
            ["<F5>"] = "toggle-preview-ccw",
            ["<F6>"] = "toggle-preview-cw",
            ["<C-d>"] = "preview-page-down",
            ["<C-u>"] = "preview-page-up",
        },
        fzf = {
            false,
            ["f3"] = "toggle-preview-wrap",
            ["f4"] = "toggle-preview",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-u"] = "preview-page-up",
            ["ctrl-a"] = "beginning-of-line",
            ["ctrl-e"] = "end-of-line",
            ["alt-n"] = "half-page-down",
            ["alt-p"] = "half-page-up",
            ["alt-g"] = "last",
            ["alt-h"] = "first",
            ["tab"] = "toggle",
            ["shift-tab"] = "toggle-all",
        },
    },
    actions = {
        files = {
            false,
            ["ctrl-q"] = false,
            ["enter"] = actions.file_edit_or_qf,
            ["ctrl-x"] = actions.file_split,
            ["ctrl-v"] = actions.file_vsplit,
            ["ctrl-t"] = actions.file_tabedit,
        },
    },

    -- Pickers
    files = {
        prompt = "Files> ",
        cwd_prompt = false,
        formatter = "path.dirname_first",
        actions = {
            ["ctrl-z"] = actions.toggle_hidden,
        },
    },
    git = {
        status = {
            actions = {
                ["right"] = false,
                ["left"] = false,
                ["ctrl-x"] = { fn = actions.git_reset, reload = true },
                ["ctrl-g"] = { fn = actions.git_stage_unstage, reload = true },
            },
        },
    },
    keymaps = {
        previewer = false,
        show_details = false,
    },
})

nmap("<leader>R", fzf.resume, "Resume the last list picker")
nmap("<leader>lk", fzf.keymaps, "List keymaps")

nmap("<leader>f", fzf.files, "List files")
nmap("<leader>/", fzf.live_grep_glob, "List lines filtered by live grep")
nmap("<leader>*", fzf.grep_cword, "List lines filtered by the word under the cursor")
vmap("<leader>*", fzf.grep_visual, "List lines filtered by the selection")

nmap("<leader>ll", fzf.loclist, "List the loclist")
nmap("<leader>lq", fzf.quickfix, "List the quickfix")
nmap(
    "<leader>lw",
    partial(fzf.diagnostics_workspace, {
        cwd_only = true,
        severity_limit = vim.diagnostic.severity.WARN,
    }),
    "List diagnostics with severity WARN and ERROR"
)
nmap(
    "<leader>le",
    partial(fzf.diagnostics_workspace, {
        cwd_only = true,
        severity_only = vim.diagnostic.severity.ERROR,
    }),
    "List diagnostics with severity ERROR"
)

nmap("<leader>lc", fzf.git_bcommits, "List commits for the current buffer")
nmap("<leader>lC", fzf.git_commits, "List commits for the current project")
nmap("<leader>lb", fzf.git_branches, "List branches for the current project")
nmap("<leader>lg", fzf.git_status, "List git status for the current project")

nmap("<leader>la", fzf.lsp_code_actions, "List code actions for the item under the cursor")
nmap("<leader>ls", fzf.lsp_document_symbols, "List symbols for the current buffer")
nmap("<leader>lS", fzf.lsp_workspace_symbols, "List symbols for the current project")

local opts = { jump_to_single_result = true }
nmap("<leader>lt", partial(fzf.lsp_typedefs, opts), "List type definitions for the symbol under the cursor")
nmap("<leader>ld", partial(fzf.lsp_definitions, opts), "List definitions for the symbol under the cursor")
nmap("<leader>lr", partial(fzf.lsp_references, opts), "List references for the symbol under the cursor")
nmap("<leader>li", partial(fzf.lsp_implementations, opts), "List implementations for the symbol under the cursor")

nmap(
    "<leader>P",
    partial(fzf.files, {
        prompt = "Projects> ",
        cmd = "fd --exact-depth 2 -t d",
        cwd = "~/code",
        previewer = "custom:project",
        header = false,
    }),
    "List projects"
)
