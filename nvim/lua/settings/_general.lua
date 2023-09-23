local nmap = require("helpers.map").nmap
local vmap = require("helpers.map").vmap
local imap = require("helpers.map").imap
local cmap = require("helpers.map").cmap

----------------------------------------
--               General
----------------------------------------

vim.g.mapleader = " "

vim.opt.hidden = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.foldenable = false
vim.opt.wildignore:append({ ".git", ".hg", ".svn", "*.o", "*.aux", "*.png", "*.jpg", "*.pdf" })
vim.opt.completeopt = { "menu", "menuone", "noselect" }
--vim.opt.showmode = false

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.g.tex_flavor = "latex"

nmap("Q", "<Nop>", "Nothing (disabled Ex mode)")
imap("jj", "<Esc>", "Escape")
nmap("<Esc>", ":noh<CR><Esc>", "Escape and clear search highlight")
nmap("<leader>q", ":quit<CR>", "Quit (:quit)")

----------------------------------------
--              Appearance
----------------------------------------

vim.opt.termguicolors = true
vim.opt.showtabline = 2 -- always
vim.opt.colorcolumn = "101" -- overrided by ft below
vim.opt.cursorline = true
vim.opt.synmaxcol = 900

-- Avoid shifting the text each time diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

vim.g.gruvbox_material_current_word = "grey background"
--vim.g.gruvbox_material_enable_bold = 1
--vim.g.gruvbox_material_enable_italic = 1
--vim.g.gruvbox_material_background = "hard"

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

----------------------------------------
--                 Text
----------------------------------------

-- Indentation.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- 'tabstop' is used
vim.opt.expandtab = true

-- Wrapping.
vim.opt.wrap = false -- overrided by ft below
vim.opt.linebreak = true

-- Display tabs, nbsp and trailing spaces.
vim.opt.list = true
vim.opt.listchars:append({ trail = "·" })

----------------------------------------
--              Spelling
----------------------------------------

-- TODO: enable in comments.
vim.opt.spell = false -- overrided by ft below
vim.opt.spellfile = "~/.config/nvim/spell/custom.utf-8.add"
vim.opt.spelllang = { "en", "ru" }

----------------------------------------
--              Scrolling
----------------------------------------

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.sidescroll = 1

----------------------------------------
--               Splits
----------------------------------------

-- Sane splits.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Easy movement.
nmap("<C-j>", "<C-w>j", "Move to the split below")
nmap("<C-k>", "<C-w>k", "Move to the split above")
nmap("<C-l>", "<C-w>l", "Move to the split right")
nmap("<C-h>", "<C-w>h", "Move to the split left")

-- Easy resizing.
nmap("-", "3<C-w>-", "Resize window: reduce height")
nmap("=", "3<C-w>+", "Resize window: increase height")
nmap("_", "3<C-w><", "Resize window: reduce width")
nmap("+", "3<C-w>>", "Resize window: increase width")

-- Resize windows to become equal when the host window is resized.
vim.api.nvim_create_autocmd("VimResized", {
    pattern = "*",
    command = "wincmd =",
})

----------------------------------------
--               Search
----------------------------------------

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Centered search results.
nmap("*", "*zz", "Search forward for the exact word under the cursor and center view")
nmap("#", "#zz", "Search backward for the exact word under the cursor and center view")
nmap("g*", "g*zz", "Search forward for the inexact word under the cursor and center view")
nmap("g#", "g#zz", "Search backward for the inexact word under the cursor and center view")
nmap("n", "nzz", "Repeat the latest search forward and center view")
nmap("N", "Nzz", "Repeat the latest search backward and center view")

-- Very magic search by default.
nmap("/", "/\\v", "Search forward in very magic mode")
nmap("?", "?\\v", "Search backward in very magic mode")
cmap("%s/", "%s/\\v", "Search incrementally in very magic mode")

----------------------------------------
--             Move Lines
----------------------------------------

nmap("<A-j>", ":m .+1<CR>==", "Move current line down")
nmap("<A-k>", ":m .-2<CR>==", "Move current line up")
imap("<A-j>", "<Esc>:m .+1<CR>==gi", "Move current line down")
imap("<A-k>", "<Esc>:m .-2<CR>==gi", "Move current line up")
vmap("<A-j>", ":m '>+1<CR>gv=gv", "Move selected lines down")
vmap("<A-k>", ":m '<-2<CR>gv=gv", "Move selected lines up")

----------------------------------------
--              Vim Diff
----------------------------------------

-- Disable whitespaces.
vim.opt.diffopt:append("iwhite")

-- Make diffing better: https://vimways.org/2018/the-power-of-diff/.
vim.opt.diffopt:append({ "algorithm:patience", "indent-heuristic" })

-- Nice removed lines.
vim.opt.fillchars:append("diff:╱")

----------------------------------------
--            File specific
----------------------------------------

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.colorcolumn = 0
    end,
})

local function filetype(pattern, ft)
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = pattern,
        callback = function()
            vim.opt_local.filetype = ft
        end,
    })
end

-- For ansible.
filetype("*.toml.j2", "toml")
filetype("*.ini.j2", "toml")
filetype("*.sh.j2", "bash")
filetype({ "*.yml.j2", "*.yaml.j2" }, "yaml")
