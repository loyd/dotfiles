local packer = require("packer")
local use = packer.use

packer.init()

---- Common deps
use("nvim-lua/plenary.nvim")

---- Interface
use("nvim-lualine/lualine.nvim")
use({ "gruvbox-material/vim", as = "gruvbox-material" })
use("kyazdani42/nvim-web-devicons")
use("nvim-telescope/telescope.nvim")
use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
use("nvim-telescope/telescope-ui-select.nvim")
use("b0o/incline.nvim")
use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

---- Text
use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
use("ciaranm/detectindent")
use("scrooloose/nerdcommenter")
use("terryma/vim-multiple-cursors")
use("LunarWatcher/auto-pairs")
use("machakann/vim-highlightedyank")
use("rrethy/vim-illuminate")
use("hrsh7th/vim-vsnip") -- TODO: remove snippets at all
use("ggandor/leap.nvim")

---- Integrations
use("lewis6991/gitsigns.nvim")
use("rhysd/git-messenger.vim")
use("ahmedkhalf/project.nvim")
use("neovim/nvim-lspconfig")
use("simrat39/rust-tools.nvim")
use("mfussenegger/nvim-dap")
use("rcarriga/nvim-dap-ui")
use({ "saecki/crates.nvim", tag = "v0.3.0" })
use("hrsh7th/nvim-cmp")
use("hrsh7th/cmp-nvim-lsp")
use("hrsh7th/cmp-path")
use("hrsh7th/cmp-buffer")
use("hrsh7th/cmp-cmdline")
use("hrsh7th/cmp-vsnip")
use("editorconfig/editorconfig-vim")
use("sindrets/diffview.nvim")
use("j-hui/fidget.nvim")
use("SmiteshP/nvim-navic")
use("jose-elias-alvarez/null-ls.nvim")

---- Languages
use("sheerun/vim-polyglot")
use("hynek/vim-python-pep8-indent")
use("pest-parser/pest.vim")
use("ron-rs/ron.vim")

---- Misc
use("natecraddock/sessions.nvim")

---- Settings
require("settings.treesitter")
require("settings.lualine")
require("settings.telescope")
require("settings.lsp")
require("settings.cmp")
require("settings.dap")
require("settings.crates")
require("settings.sessions")
require("settings.gitsigns")
require("settings.diffview")
require("settings.project")
require("settings.fidget")
require("settings.incline")
require("settings.rust")
require("settings.leap")
require("settings.auto-pairs")
