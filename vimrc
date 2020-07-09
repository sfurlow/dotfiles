runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set modeline "Allow indivial files to start with modelines

"Syntax highlighting
filetype plugin indent on "Load filetype plugin and indent files
syntax on "Explicitly turn on syntax highlighting

"autocmd Filetype * setlocal formatoptions-=cro "Turn off auto commenting on next line

set clipboard=unnamed "Copy to system clipboard

"Misc settings
set autoindent
set smartindent
set background=dark
set backspace=indent,eol,start "Ensure backspace and delet keys work properly
set cursorline "Underlines current line
set hlsearch "Highlight search options
set ignorecase "Case-insensitive searching
set incsearch "Vim searches after every keypress
set nu rnu "Relative and absolute lines numbers
set copyindent
set lazyredraw
"set cmdheight=2
"set nowrapscan "Do not start searching again at the top of the file
set undolevels=100 "Save memory - only 100 levels used - default is 10000
set linebreak "Don't split words when wrapping long lines
set virtualedit=block,onemore "Cursor goes one character past end of line
set nojoinspaces "Join on single space
set breakindent "Wraps do not split words
set ttyfast "Performance improvement

"Briefly shows matching brace
set showmatch
set matchtime=3

"Tab settings (will expand tabs to spaces)
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Define status line colors
"hi User1 ctermfg=7 ctermbg=black
hi User1 ctermfg=7
hi User2 ctermfg=1
hi User3 ctermfg=3
hi User4 ctermfg=6

function! StatuslineGit()
    let l:branchname = system('get_git_branch.sh')
    return l:branchname
endfunction

"Status line - right-aligned (via %=)
set statusline =
set statusline +=%1*\ %=%<%F%* "file name
set statusline +=%2*%=%m%* "modified flag
set statusline +=%4*\ %=%<[%{StatuslineGit()}]%* "Git branch
set statusline +=%3*\ %=\col:%v\ %* "current column
set statusline +=%4*\ %=\row:%l/%L\ (%02p%%)\ "current row/total row (percentage)
"Statusline always showing
set laststatus=2
set cmdheight=2

"Allow bash-like autocompletion for filepaths
set wildmenu
set wildmode=longest,list

"ctags configuration
set autochdir "If no tags file found, look in parent
set tags=tags; "Semicolon necessary

set gdefault "Global search/replace by default

"Remember last position"
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Redefine line join to join without producing space
"nnoremap J gJ

"Moveing up/down wont' skip wrapped lines
"nnoremap j gj
"nnoremap k gk

let mapleader=","
"Edit vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
"Re-load vimrc
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

set list
set listchars=tab:<.,trail:>,extends:# "Show characters for tabs and trailing spaces

"Switch buffers with changes
set hidden

nnoremap <leader>gs :InsertBothGetterSetter<CR>
vnoremap <leader>gs :InsertBothGetterSetter<CR>
nnoremap <leader>gg :InsertGetterOnly<CR>
vnoremap <leader>gg :InsertGetterOnly<CR>

"Set ant as compiler and override makeprg so :make and :cn :cp work for
"quickfix
augroup java
    autocmd!
    autocmd BufRead *.java exe ":compiler ant"
    autocmd BufRead *.java set makeprg=ant\ -q\ -find\ build.xml
augroup END

"Re-search for last searched term
nnoremap <silent> <leader>// :/<C-r>/<CR>
"Clear search highlight
nnoremap <silent> ,/c :nohlsearch<CR>
