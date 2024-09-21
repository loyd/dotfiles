local fzf = require("fzf-lua")
local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap
local partial = require("helpers.func").partial

fzf.setup({
    "skim",
    winopts = {
        backdrop = 80,
    },
    files = {
        prompt = "Files> ",
        cwd_prompt = false,
        formatter = "path.dirname_first",
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
        severity_limit = vim.diagnostic.severity.WARN,
    }),
    "List diagnostics with severity WARN and ERROR"
)
nmap(
    "<leader>le",
    partial(fzf.diagnostics_workspace, {
        severity_only = vim.diagnostic.severity.ERROR,
    }),
    "List diagnostics with severity ERROR"
)

nmap("<leader>lc", fzf.git_bcommits, "List commits for the current buffer")
nmap("<leader>lC", fzf.git_commits, "List commits for the current project")
nmap("<leader>lb", fzf.git_branches, "List branches for the current project")
nmap("<leader>lg", fzf.git_status, "List git status for the current project")

nmap("<leader>la", fzf.lsp_code_actions, "List code actions for the item under the cursor")
nmap("<leader>lr", fzf.lsp_references, "List references for the symbol under the cursor")
nmap("<leader>ls", fzf.lsp_document_symbols, "List symbols for the current buffer")
nmap("<leader>lS", fzf.lsp_workspace_symbols, "List symbols for the current project")
nmap("<leader>li", fzf.lsp_implementations, "List implementations for the symbol under the cursor")
nmap("<leader>ld", fzf.lsp_definitions, "List definitions for the symbol under the cursor")
nmap("<leader>lt", fzf.lsp_typedefs, "List type definitions for the symbol under the cursor")

nmap(
    "<leader>P",
    partial(fzf.files, {
        prompt = "Projects> ",
        cmd = "fd --exact-depth 2 -t d",
        cwd = "~/workspace",
        previewer = "custom:project",
    }),
    "List projects"
)
