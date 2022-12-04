local navic = require("nvim-navic")

require("incline").setup({
    render = function(props)
        if props.focused and navic.is_available() then
            return navic.get_location()
        end
    end,
    window = {
        margin = {
            horizontal = 2,
            vertical = 2,
        },
        padding = 0,
        options = {
            winblend = 100,
        },
        winhighlight = {
            active = {
                Normal = "Yellow",
            },
        },
    },
})
