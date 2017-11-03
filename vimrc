syntax on
filetype indent on
filetype plugin on

set autoindent
set smartindent
set smartcase

"Spaces and tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"UI
set relativenumber
set ruler
set showcmd
set cursorline
set lazyredraw
set showmatch
set incsearch
set hlsearch
colorscheme desert

"Remember position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"status line
set laststatus=2

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
