
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
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/bufexplorer.zip'

"
" original repos on GitHub
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""

color blackboard

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

"""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
"""""""""""""""""""""""""""""""""""""""""""""

" Fast editing of the .vimrc
map <leader>v :tabe! $MYVIMRC<cr>
map <leader>c :tabe! ~/.vim/bundle/snipMate/snippets/c.snippets<cr>
map <leader>l :tabe! ~/.vim/bundle/snipMate/snippets/lua.snippets<cr>
map <leader>p :tabe! ~/.vim/bundle/snipMate/snippets/cpp.snippets<cr>

" Settings for dealing with buffers
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
autocmd BufWritePre *.lua,*.c,*.cpp,*.h :call Preserve("%s/\\s\\+$//e")

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

" MRU
let MRU_Max_Entries = 500
map <leader>m :MRU<CR>

""""""""""""""""""""""""""""""
" TComment
""""""""""""""""""""""""""""""
" vnoremap / :TComment<CR>
map g/ :TComment<CR>

""""""""""""""""""""""""""""""
" Bufexplorer
""""""""""""""""""""""""""""""
" Do not show default help.
let g:bufExplorerDefaultHelp=0
