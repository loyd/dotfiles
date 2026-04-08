vim.pack.add({ "https://github.com/sainnhe/gruvbox-material" })

vim.g.gruvbox_material_current_word = "grey background"
vim.g.gruvbox_material_float_style = "blend"

local function toggle_background()
    if vim.opt.background:get() == "light" then
        vim.opt.background = "dark"
    else
        vim.opt.background = "light"
    end

    vim.cmd.colorscheme("gruvbox-material")
end

vim.opt.background = "light"
toggle_background() -- immediately switch to dark

vim.api.nvim_create_user_command("ToggleBackground", toggle_background, {})
