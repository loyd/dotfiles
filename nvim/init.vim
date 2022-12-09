"     __   _(_)_ __ ___  _ __ ___
"      \ \ / / | '_ ` _ \| '__/ __|
"       \ V /| | | | | | | | | (__
"      (_)_/ |_|_| |_| |_|_|  \___|
"

" Who cares about vi?
set nocompatible

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                 GUI
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=c

    set t_Co=256
endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"               General
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set nonumber
set showcmd
set autoread
set autochdir

set nohidden
set noswapfile
set nobackup
set nowritebackup

set laststatus=2
set showtabline=2
set noshowmode

set wildignore+=.git,.hg,.svn,*.o,*.aux,*.png,*.jpg,*.pdf

set nofoldenable
syntax on

" Make backspace work like other editors.
set backspace=indent,eol,start

" Improve responsiveness of some plugins (gitgutter, coc).
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Disable Ex mode.
nnoremap Q <nop>

" Use space as <leader>.
let mapleader=" "

" Avoid the escape key.
inoremap jj <Esc>

" Clear highlighting.
nnoremap <silent> <Esc> :noh<CR><Esc>

" Centered search results.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default.
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %s/\v

" No whitespace in vimdiff.
set diffopt+=iwhite

" Make diffing better: https://vimways.org/2018/the-power-of-diff/.
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

" Better diffs.
set fillchars+=diff:╱

let g:tex_flavor="latex"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"               Plugins
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

lua require('plugins')

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"             Indentation
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Auto indent pasted text.
" TODO: buggy in neovim 0.4
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>
" TODO: also buggy
"nnoremap p p=`]
"nnoremap P P=`]

filetype plugin indent on

" Display tabs and trailing spaces visually.
set list listchars=tab:\ \ ,trail:·

set nowrap
set linebreak

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"              Scrolling
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set scrolloff=8
set sidescrolloff=5
set sidescroll=1

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"               Search
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set incsearch
set hlsearch
set ignorecase
set smartcase

if has('nvim')
    set inccommand=split
endif

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"              Spelling
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set nospell " overrided by ft
set spellfile=~/.config/nvim/spell/custom.utf-8.add
set spelllang=en,ru

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"             Appearance
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set termguicolors

"let g:gruvbox_material_enable_bold=1
"let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_current_word='grey background'
let g:gruvbox_material_transparent_background=0
"let g:gruvbox_material_background='hard'

" Lines.
set colorcolumn=101
set cursorline
set synmaxcol=900

function! ToggleBackground()
    if (&background != "dark")
        set background=dark
    else
        set background=light
    endif

    colorscheme gruvbox-material
endfunction

set background=light
call ToggleBackground()

command ToggleBackground :call ToggleBackground()

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"               Splits
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Sane splits.
set splitbelow
set splitright

" Easy movement.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Easy resizing.
nnoremap - 3<C-w>-
nnoremap = 3<C-w>+
nnoremap _ 3<C-w><
nnoremap + 3<C-w>>

if has('nvim')
    " Some terminal settings.
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd TermOpen * setlocal nonumber norelativenumber

    tnoremap <ESC> <C-\><C-n>
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    tnoremap <C-h> <C-\><C-n><C-w>h
endif

" Resize the split panes to become equal when the host window is resized.
autocmd VimResized * wincmd =

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"         Move up/down lines
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"             File specific
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"TODO: what about using groups?
autocmd FileType tex,markdown setlocal wrap spell cc=0 nonu nornu
autocmd FileType proto let g:ale_proto_protoc_gen_lint_options='-I ' . ale#Escape(getcwd())

" I don't know who enables wrapping everytime.
autocmd FileType rust setlocal nowrap

" For ansible.
autocmd BufRead,BufNewFile *.toml.j2 set filetype=toml
autocmd BufRead,BufNewFile *.ini.j2 set filetype=toml
autocmd BufRead,BufNewFile *.sh.j2 set filetype=bash
autocmd BufRead,BufNewFile *.yml.j2 set filetype=yaml
