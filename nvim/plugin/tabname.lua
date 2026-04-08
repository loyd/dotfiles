local augroup = require("helpers.augroup")
local extract_project_name = require("helpers.project").extract_project_name

-- Set a tab's name to a project's name of an active buffer.
augroup("ProjectTabname", function(autocmd)
    autocmd({ "BufWinEnter", "BufEnter", "WinEnter" }, {}, function()
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
    end)
end)
