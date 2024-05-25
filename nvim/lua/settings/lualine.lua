local lualine = require("lualine")
local symbols = require("settings._symbols")
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
        symbols = symbols.diagnostics,
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
                local filter = { severity = { min = severity.WARN } }
                local bufnr_whitelist = {}
                local count = {}

                for _, d in ipairs(vim.diagnostic.get(nil, filter)) do
                    -- Determine whether a buffer belongs to the current project.
                    if bufnr_whitelist[d.bufnr] == nil then
                        bufnr_whitelist[d.bufnr] = extract_project_name(d.bufnr) == project
                    end

                    if bufnr_whitelist[d.bufnr] then
                        count[d.severity] = (count[d.severity] or 0) + 1
                    end
                end

                return {
                    error = count[severity.ERROR],
                    warn = count[severity.WARN],
                }
            end,
        },
        sections = { "error", "warn" },
        symbols = symbols.diagnostics,
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
