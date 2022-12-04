local lualine = require("lualine")
local extract_project_name = require("helpers.project").extract_project_name

local C = {
    mode = "mode",
    encoding = "encoding",
    fileformat = "fileformat",
    location = "location",
    progress = "progress",
    tabs = {
        "tabs",
        mode = 2,
        max_length = vim.o.columns,
    },
    filename = {
        "filename",
        path = 1,
        symbols = { modified = "", readonly = "" },
        -- TODO: `fmt` with replacing `src/` and `WORKSPACE_DIR`.
    },
    filetype = {
        "filetype",
        icon_only = true,
    },
    branch = {
        "b:gitsigns_head",
        icon = "",
    },
    diff = {
        "diff",
        source = function()
            local status = vim.b.gitsigns_status_dict
            if status then
                return {
                    added = status.added,
                    modified = status.changed,
                    removed = status.removed,
                }
            end
        end,
    },
    diagnostics_buffer = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info" },
    },
    diagnostics_project = {
        "diagnostics",
        sources = {
            function()
                local project = extract_project_name(0)
                if not project then
                    return
                end

                local severity = vim.diagnostic.severity
                local stats = {}

                for _, d in ipairs(vim.diagnostic.get(nil)) do
                    -- Filter by severity here instead of passing to `get()` to avoid extra iteration.
                    if d.severity <= severity.WARN and extract_project_name(d.bufnr) == project then
                        stats[d.severity] = (stats[d.severity] or 0) + 1
                    end
                end

                return {
                    error = stats[severity.ERROR],
                    warn = stats[severity.WARN],
                }
            end,
        },
        sections = { "error", "warn" },
    },
}

local statusline = {
    lualine_a = { C.filetype, C.filename },
    lualine_b = { C.diff },
    lualine_c = {},
    lualine_x = { C.diagnostics_buffer },
    lualine_y = { C.encoding, C.fileformat },
    lualine_z = { C.progress, C.location },
}

local tabline = {
    lualine_a = { C.tabs },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { C.diagnostics_project },
    lualine_y = { C.branch },
    lualine_z = { C.mode },
}

lualine.setup({
    options = {
        always_divide_middle = false,
    },
    sections = statusline,
    inactive_sections = statusline,
    tabline = tabline,
})

-- Set a tab's name to a project's name of an active buffer.
local augroup = vim.api.nvim_create_augroup("tabname-setter", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "WinEnter" }, {
    group = augroup,
    pattern = "*",
    callback = function()
        -- TODO: check all buffers in the window. How is `nvim_list_bufs` expensive?
        for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
            local winnr = vim.api.nvim_tabpage_get_win(tab)
            local bufnr = vim.api.nvim_win_get_buf(winnr)
            local project = extract_project_name(bufnr)

            if project then
                vim.api.nvim_tabpage_set_var(tab, "tabname", project)
            else
                pcall(function()
                    vim.api.nvim_tabpage_del_var(tab, "tabname")
                end)
            end
        end
    end,
})
