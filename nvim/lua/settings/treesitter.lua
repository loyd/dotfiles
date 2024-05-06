require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "rust",
        "lua",
        "javascript",
        "typescript",
        "python",
        "glsl",
        "toml",
        "json",
        "yaml",
        "html",
        "markdown",
        "markdown_inline",
        "sql",
        "comment",
        "vim",
        "regex",
        "bash",
    },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    ident = { enable = true },
})
