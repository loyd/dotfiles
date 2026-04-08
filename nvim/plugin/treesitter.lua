vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local augroup = require("helpers.augroup")

local list = {
    "rust",
    "lua",
    "javascript",
    "typescript",
    "python",
    "glsl",
    "toml",
    "json",
    "yaml",
    "kdl",
    "html",
    "xml",
    "markdown",
    "markdown_inline",
    "sql",
    "comment",
    "vim",
    "regex",
    "bash",
}

require("nvim-treesitter").install(list)

local filetypes = vim.iter(list):map(vim.treesitter.language.get_filetypes):flatten():totable()

augroup("TreesitterStart", function(autocmd)
    autocmd("FileType", { pattern = filetypes }, function(ev)
        -- Highlighting
        vim.treesitter.start(ev.buf)
        -- Folding
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        -- Indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
end)
