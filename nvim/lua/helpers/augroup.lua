local function augroup(group, cb)
    group = "custom/" .. group

    vim.api.nvim_create_augroup(group, { clear = true })

    cb(function(event, opts, command)
        opts.group = group

        if type(command) == "function" then
            opts.callback = command
        else
            opts.command = command
        end

        vim.api.nvim_create_autocmd(event, opts)
    end)
end

return augroup
