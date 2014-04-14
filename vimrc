
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""
" Set up Vundle
"""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/Parameter-Text-Objects'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/tComment'

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""

" Sets the titlebar of the terminal to be the name of the file
set title

" Hides buffers rather than closing them when opening a new buffer
set hidden

"Don't redraw while executing macros
set nolazyredraw

" for regular expressions
set magic

" Increases the command history
set history=1000

" Forces lines to not wrap
set nowrap

" Does not make a sound when there is an error
set noerrorbells

" Backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Show the line and column number of the cursor
set ruler

" ensures the cursor never reaches the bottom of the window
set scrolloff=2

" Tab settings
set tabstop=4 " Tabs are 4 spaces
set shiftwidth=4 " Tab characters are 4 spaces
set expandtab " Tab key creates spaces instead of tabs
set autoindent
set smartindent " Intelligently guess the indentation level of the next line
set smarttab " Indenting is done intelligently, as well as backspacing through indents

" Searching options
set incsearch " Incremental search (begin searching as soon as you star typing)
set ignorecase " Ignore the case when searching strings
set smartcase " Ignore the ignorecase option if search pattern contains uppcase letters

" Shows number along the left side
set number

" Opens moves to the existing buffer instead of reopening it
set switchbuf=useopen,usetab

" Decide folds using indentation
set foldmethod=syntax
set foldenable
set foldlevel=1000

" turn on syntax highlighting
syntax on

" Turns on autodetection of filetypes
filetype on

" Loads the plugins for specific filetypes
filetype plugin on

" sets GNU grep to be the program to run when searching
set grepprg=grep\ -nH\ $* 

" what the mouse pointer looks like in different modes
set mouses=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

" Remove menu bar
set guioptions=rLte

" Put a line at 80 characters
set colorcolumn=81

"""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
"""""""""""""""""""""""""""""""""""""""""""""

" Fast editing of the .vimrc
nnoremap <leader>v :tabe! $MYVIMRC<CR>
nnoremap <leader>c :botright cwindow<CR>

" Settings for dealing with buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Switch between reltaive numbering and absolute numbering
if exists("+relativenumber")
    nmap <leader>r :set relativenumber<CR>
endif
nmap <leader>n :set number<CR>

" Make yank not stupid
map Y y$

" Cutting and pasting
vmap <C-c> "+y
vmap <C-x> "+d
imap <C-v> <esc>"+pa

" I hit shift k a lot when I mean to just hit k, for some reason
map <S-k> k

imap jj <ESC>
imap kk <ESC>

nnoremap <silent> <f12> :!ctags -R *<CR>

nnoremap <space> za

" Quick save and loading of sessions
nnoremap <F7> :mksession! ./.vim_session<cr>
nnoremap <F8> :source ./.vim_session<cr>

nnoremap <C-;> :!

"""""""""""""""""""""""""""""""""""""""""""""
" Other neat stuff
"""""""""""""""""""""""""""""""""""""""""""""

" When vimrc is edited, reload it
autocmd! bufwritepost ~/.vimrc source $MYVIMRC
autocmd! bufwritepost ~/.vim/vimrc source $MYVIMRC
autocmd! bufwritepost $VIM/vimfiles/vimrc source $MYVIMRC

" Display matches of last search in window
nnoremap <silent> <leader>g :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" files that can not be written should not be modifiable
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if &ro | set nomodifiable | endif
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if !&ro | set modifiable | endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,longest

function! Preserve(command)
    let w = winsaveview()
    execute a:command
    call winrestview(w)
endfunction

nnoremap <silent> <leader>= :call Preserve("normal gg=G")<CR>
nnoremap <silent> <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>
autocmd BufWritePre *.js,*.html,*.css,*.lua,*.c,*.cpp,*.h :call Preserve("%s/\\s\\+$//e")

cmap <C-V> <C-R>+

" replace selected text with text in paste register, without overwriting the
" text in the yank register with the text replaced.
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! PasteOver()
     let s:restore_reg = @"
     return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p PasteOver()

"""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""

""" MRU
let MRU_Max_Entries = 500
" nnoremap <leader>m :MRU<CR>
nnoremap <C-n> :MRU<CR>

""" TComment
nnoremap g/ :TComment<CR>
vnoremap g/ :TComment<CR>

""" Bufexplorer
" Do not show default help.
let g:bufExplorerDefaultHelp=0
nnoremap <C-b> :BufExplorer<cr>

""" NERDTree
nnoremap <f2> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""

""" HTML
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2
