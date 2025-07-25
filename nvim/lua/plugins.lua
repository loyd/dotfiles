local packer = require("packer")
local use = packer.use

packer.init()

use("wbthomason/packer.nvim")

---- Common deps
use("nvim-lua/plenary.nvim")

---- Interface
use("nvim-lualine/lualine.nvim")
use({ "sainnhe/gruvbox-material", as = "gruvbox-material" })
use("nvim-tree/nvim-web-devicons")
use({ "ibhagwan/fzf-lua" })
use("rmagatti/goto-preview")
use("caenrique/swap-buffers.nvim")
use("nvim-tree/nvim-tree.lua")
use({ "stevearc/dressing.nvim" })
use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

---- Text
use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
use("ciaranm/detectindent")
use("mg979/vim-visual-multi")
use("LunarWatcher/auto-pairs")
use("machakann/vim-highlightedyank")
use("rrethy/vim-illuminate")
use("ggandor/leap.nvim")

---- Integrations
use("lewis6991/gitsigns.nvim")
use("lsig/messenger.nvim")
use("mrcjkb/rustaceanvim")
use("mfussenegger/nvim-dap")
use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
use({ "saecki/crates.nvim", tag = "stable" })
use("hrsh7th/nvim-cmp")
use("onsails/lspkind.nvim")
use("hrsh7th/cmp-nvim-lsp")
use("hrsh7th/cmp-path")
use("hrsh7th/cmp-buffer")
use("hrsh7th/cmp-cmdline")
use("editorconfig/editorconfig-vim")
use("sindrets/diffview.nvim")
use("nvimtools/none-ls.nvim")
use("github/copilot.vim")

---- Languages
use("sheerun/vim-polyglot")
use("hynek/vim-python-pep8-indent")
use("pest-parser/pest.vim")
use("ron-rs/ron.vim")

---- Misc
use("natecraddock/sessions.nvim")
