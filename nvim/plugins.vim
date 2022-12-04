call plug#begin('~/.vim/plugged')

" Interface.
Plug 'nvim-lualine/lualine.nvim'
Plug 'gruvbox-material/vim', { 'as': 'gruvbox-material' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'b0o/incline.nvim'

" Text.
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'ciaranm/detectindent'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'LunarWatcher/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'rrethy/vim-illuminate'
Plug 'hrsh7th/vim-vsnip'
Plug 'ggandor/leap.nvim'

" Integrations.
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/git-messenger.vim'
Plug 'ahmedkhalf/project.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }
Plug 'editorconfig/editorconfig-vim'
Plug 'sindrets/diffview.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Misc.
Plug 'nvim-lua/plenary.nvim'
Plug 'natecraddock/sessions.nvim'

" Languages.
Plug 'sheerun/vim-polyglot'
Plug 'hynek/vim-python-pep8-indent'
Plug 'pest-parser/pest.vim'
Plug 'ron-rs/ron.vim'

call plug#end()

" Lua
lua require('settings.treesitter')
lua require('settings.lualine')
lua require('settings.telescope')
lua require('settings.lsp')
lua require('settings.cmp')
lua require('settings.dap')
lua require('settings.crates')
lua require('settings.sessions')
lua require('settings.gitsigns')
lua require('settings.diffview')
lua require('settings.project')
lua require('settings.fidget')
lua require('settings.incline')
lua require('settings.rust')
lua require('settings.leap')

" VimL
runtime viml/auto-pairs.vim
