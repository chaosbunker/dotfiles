" Make Vim more useful
set nocompatible

" Enable syntax highlighting
syntax enable

" Highlight searches
set hlsearch

" Enable mouse scroll
set mouse=a

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Enable line numbers
set number

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don't add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
" (create directories if they don't yest exist)
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
if !isdirectory($HOME."/.vim/backups")
    call mkdir($HOME."/.vim/backups", "", 0700)
endif
if !isdirectory($HOME."/.vim/swaps")
    call mkdir($HOME."/.vim/swaps", "", 0700)
endif
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo/

" Turn on backups
set backup

" Don't create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Turn on undo
set undofile

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Highlight current line
set cursorline
set cursorcolumn
hi cursorline term=bold cterm=bold
hi cursorcolumn term=bold cterm=bold ctermbg=none

" Make tabs look right
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Show all changes
set report=0

" Disable error bells
set noerrorbells

" Don't reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don't show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it's being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Hide buffers instead of closing them
" This is almost a must if you wish to use buffers in this way.
set hidden

" toggle paste
set pastetoggle=<F10>

" Convert tabs to spaces (,ts)
function! ConvertSpacesToTabs()
       	let save_cursor = getpos(".")
       	let old_query = getreg('/')
       	:%s/\ \ /\t/e
       	call setpos('.', save_cursor)
       	call setreg('/', old_query)
endfunction

" Convert spaces to tabs (,st)
function! ConvertTabsToSpaces()
       	let save_cursor = getpos(".")
       	let old_query = getreg('/')
       	:%s/\t/\ \ /e
       	call setpos('.', save_cursor)
       	call setreg('/', old_query)
endfunction

" Strip trailing whitespace (,ss)
function! StripWhitespace()
       	let save_cursor = getpos(".")
       	let old_query = getreg('/')
       	:%s/\s\+$//e
       	call setpos('.', save_cursor)
       	call setreg('/', old_query)
endfunction

filetype plugin indent on

" -----------------------------------------------------------------
" remaps
" -----------------------------------------------------------------

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" <F2> to save
:nnoremap <F2> :w<cr>
:inoremap <F2> <c-o>:w<cr>

noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>ts :call ConvertTabsToSpaces()<CR>
noremap <leader>st :call ConvertSpacesToTabs()<CR>

" close buffer without losing split window
nmap <expr> <silent> <C-c> len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Quickly switch between tabs and buffers
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bn :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bc :bp <BAR> bd #<CR>