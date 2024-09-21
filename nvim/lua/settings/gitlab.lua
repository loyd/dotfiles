local gitlab = require("gitlab")

-- XXX: diffview is not loaded, why?
if vim.fn.exists(":DiffviewOpen") == 0 then
    vim.api.nvim_create_user_command("DiffviewOpen", function() end, {})
end

gitlab.setup({
    reviewer = "diffview",
})
