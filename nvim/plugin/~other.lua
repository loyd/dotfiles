vim.pack.add({
    "https://github.com/editorconfig/editorconfig-vim",
    "https://github.com/sheerun/vim-polyglot",
    "https://github.com/mg979/vim-visual-multi",
    "https://github.com/rrethy/vim-illuminate",
    "https://github.com/nmac427/guess-indent.nvim",
    "https://codeberg.org/andyg/leap.nvim",
    "https://github.com/folke/snacks.nvim",
})

require("guess-indent").setup({})
require("leap").add_default_mappings()
require("snacks").setup({
    -- TODO: check other (e.g. the picker)
    input = {},
    terminal = {},
})
