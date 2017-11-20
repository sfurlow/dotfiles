syntax on
filetype plugin indent on

set autoindent
set smartindent
set smartcase

"Spaces and tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set history=1000
set nocompatible
"set nowrap
set showmode
set tw=80
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

"set cmdheight=1

"UI
set cursorline
set hlsearch
set incsearch
set lazyredraw
set relativenumber
set ruler
set showcmd
set showmatch
"colorscheme desert

"Remember position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"status line
set laststatus=1

hi User1 ctermbg=black ctermfg=red   guibg=green guifg=red
hi User2 ctermbg=black   ctermfg=blue  guibg=red   guifg=blue
hi User3 ctermbg=black  ctermfg=green guibg=blue  guifg=green

set statusline=
set statusline+=%1*  "switch to User1 highlight
set statusline+=%=%F\    "full filename
set statusline+=%2*  "switch to User2 highlight
set statusline+=%y\    "filetype
set statusline+=%3*  "switch to User3 highlight
set statusline+=row=%l\\%L\    "line number/total lines
set statusline+=col=%c\    "column number
set statusline+=%1*   "switch back to statusline highlight
set statusline+=%P   "percentage thru file

let mapleader = ","
