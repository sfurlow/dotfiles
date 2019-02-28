runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set modeline
set nocompatible

"Syntax highlighting
filetype plugin indent on
syntax on

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
set relativenumber "Relative lines numbers
set copyindent
set lazyredraw

"Briefly shows matching brace
set showmatch
set matchtime=3

"Tab settings (will expand tabs to spaces)
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

"Define status line colors
hi User1 ctermfg=7 ctermbg=black
hi User2 ctermfg=1 ctermbg=black
hi User3 ctermfg=3 ctermbg=black
hi User4 ctermfg=6 ctermbg=black

"Status line - right-aligned (via %=)
set statusline =
set statusline +=%1*\ %=%<%F%* "file name
set statusline +=%2*%=%m%* "modified flag
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
set tags=tags;

"Filetype Syntax Highlighting
au BufNewFile,BufRead *.wlst setf python
au BufNewFile,BufRead *.xhtml setf xml
"autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set ft=sh | set syn=sh | endif

"Open new tab
nnoremap <C-n> :tabnew!<CR>
" Toggle tabs
nnoremap <C-u> gt

"Clear search
nmap <silent> ,/ :nohlsearch<CR>

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
nmap <silent> <leader>ev :e $MYVIMRC<CR>
"Re-load vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"toggle paste mode
nmap <silent> <leader>sp :set paste!<CR>

set list
set listchars=tab:<.,trail:>,extends:# "Show characters for tabs and trailing spaces

"disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Easy window navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"List buffers and take number input for easy switching
nnoremap <silent> <leader>bl :LS<CR>:buffer<Space>

"Vertical split
nnoremap <silent> <leader>gf :vertical wincmd f<CR>

"vim-java insert getters and setters
vnoremap <silent> <leader>g :InsertGetterOnly<CR>
vnoremap <silent> <leader>s :InsertSetterOnly<CR>
vnoremap <silent> <leader>gs :InsertBothGetterSetter<CR>

"Switch buffers with changes
set hidden

"List buffers - show filename only
function! ListBuffers()
    redir => ls_output
    silent exec 'ls'
    redir END

    let list = substitute(ls_output, '"\(\f*\/\)*\(\f*\)"\s*\w*\s*\d*' , '\=submatch(2)', "g")

    echo list
endfunction

command! LS call ListBuffers()
function! FixBraces()
    "Convert tabs to spaces
    :%retab!

    "Move trailing braces to newline
    :silent! %s#^\(\s*\).*\zs{\s*$#\r\1{#

    "Replace two newlines before bracket with single newline
    :silent! %s#\(\s*\S.*\)\n^\s*$\n^\s*{#\1\r{#

    "Move right brace to new line
    :silent! %s#\(\s*\)}\(.*\)#\1}\r\2#

    "Join throws clauses
    :silent! %s#\(\s*\S.*\)\n\s*throws\(.*\)#\1 throws \2#

    "Remove trailing whitespace
    :silent! %s#\s*$##

    "Replace internal multiple spaces
    :silent! %s#\(\S\+\)\s\{2,}#\1 #

    "Replace 3 or more blank lines
    :silent! %s#\n\{3,}#\r\r#

endfunction

vnoremap // y/\V<C-R>"<CR>

command! Fixws call Fws()
function! Fws()
    :%retab!
    :silent! %s#\s\s\+# #
    :silent! %s#\s*$##
    let fts = ['ant', 'xml']
    if index(fts, &filetype) >= 0
        :silent! %!xmllint --format --recover - 2>/dev/null
    endif
    let fts = ['html']
    if index(fts, &filetype) >= 0
        :silent! %!xmllint --html --format --recover - 2>/dev/null
    endif
    :silent! normal gg=G
endfunction

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")
