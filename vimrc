" This is the vimrc file for use across all computers I use.
" Changes specific to a specific computer should go in ~/.vimrc.
" Changes specific to NeoVim should go in ~/.vim/init.vim

set nocompatible

" Used throughout to source platform specific
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles here:

" UltiSnips is the ultimate solution for snippets in Vim.
if has("python3")
  Bundle 'SirVer/ultisnips'
endif
" Solarized Colorscheme for Vim.
Bundle 'altercation/vim-colors-solarized'
" Silver searcher (AG) plugin for Vim.
Bundle 'gabesoft/vim-ags'
" Sometimes, it's useful to line up text.
Bundle 'godlygeek/tabular'
" codefmt is a utility for syntax-aware code formatting.
Bundle 'google/vim-codefmt'
" Maktaba is a vimscript library for plugin authors.
Bundle 'google/vim-glaive'
" Maktaba is a vimscript plugin library. It is designed for plugin authors.
Bundle 'google/vim-maktaba'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Bundle 'ctrlpvim/ctrlp.vim'
" CMake integration.
Bundle 'ilyachur/cmake4vim'
" Select text in visual mode and then hit * and # to search for it elsewhere.
Bundle 'nelstrom/vim-visual-star-search'
" The NERDTree is a file system explorer for the Vim editor.
Bundle 'scrooloose/nerdtree'
" Syntastic is a syntax checking plugin for Vim.
Bundle 'scrooloose/syntastic'
" Fugitive is the premier Vim plugin for Git.
Bundle 'tpope/vim-fugitive'
" Repeat.vim remaps . in a way that plugins can tap into it.
Bundle 'tpope/vim-repeat'
" This script defines a parameter text object.
Bundle 'vim-scripts/Parameter-Text-Objects'
" A few of quick commands to swtich between source files and header files 
" quickly.
Bundle 'vim-scripts/a.vim'
" Improved case sensitive substitution and variable name coercion.
Bundle 'vim-scripts/abolish.vim'
" With bufexplorer, you can quickly and easily switch between buffers.
Bundle 'vim-scripts/bufexplorer.zip'
" This is a script to unload, delete or wipe a buffer without closing the 
" window.
Bundle 'vim-scripts/bufkill.vim'
" The Most Recently Used (MRU) plugin.
Bundle 'vim-scripts/mru.vim'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML 
" tags, and more.
Bundle 'vim-scripts/surround.vim'
" TComment works like a toggle, i.e., it will comment out text that contains 
" uncommented lines, and it will uncomment already commented text (i.e. text 
" that contains no uncommented lines).
Bundle 'vim-scripts/tComment'
" A code-completion engine for Vim
if has("python3")
  Bundle 'ycm-core/YouCompleteMe'
endif
 
call SourceIfExists('~/.vimlocal/bundles')

filetype plugin indent on  " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

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
set softtabstop=4 " Soft tabs are 4 spaces
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
" set foldmethod=syntax
set foldmethod=indent
set foldenable
set foldlevel=1000

" turn on syntax highlighting
syntax on

" Turns on autodetection of filetypes
filetype on

" Loads the plugins for specific filetypes
filetype plugin on

" sets GNU grep to be the program to run when searching
set grepprg=grep\ -rnH\ $*

" what the mouse pointer looks like in different modes
set mouse=""

" Remove menu bar
set guioptions=rLte

" Put a line at 80 characters
set colorcolumn=81

" Make the dividers look nicer
set fillchars+=vert:│

" Highlight search results
set hlsearch

" Reload files if they've changed so we don't operate on stale data.
set autoread

" Show the status bar, even when there's only one file open
set laststatus=2

" Disable swap files. I save often enough that these just get in the way.
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast editing of the .vimrc
nnoremap <leader>v :tabe! $MYVIMRC<CR>
nnoremap <leader>cw :botright cwindow<CR>

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

inoremap <ScrollWheelUp> <nop>
inoremap <S-ScrollWheelUp> <nop>
inoremap <C-ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <S-ScrollWheelDown> <nop>
inoremap <C-ScrollWheelDown> <nop>
inoremap <ScrollWheelLeft> <nop>
inoremap <S-ScrollWheelLeft> <nop>
inoremap <C-ScrollWheelLeft> <nop>
inoremap <ScrollWheelRight> <nop>
inoremap <S-ScrollWheelRight> <nop>
inoremap <C-ScrollWheelRight> <nop>

nnoremap <ScrollWheelUp> <nop>
nnoremap <S-ScrollWheelUp> <nop>
nnoremap <C-ScrollWheelUp> <nop>
nnoremap <ScrollWheelDown> <nop>
nnoremap <S-ScrollWheelDown> <nop>
nnoremap <C-ScrollWheelDown> <nop>
nnoremap <ScrollWheelLeft> <nop>
nnoremap <S-ScrollWheelLeft> <nop>
nnoremap <C-ScrollWheelLeft> <nop>
nnoremap <ScrollWheelRight> <nop>
nnoremap <S-ScrollWheelRight> <nop>
nnoremap <C-ScrollWheelRight> <nop>

inoremap kj <esc>

" Make yank not stupid
map Y y$

" Cutting and pasting
vmap <C-c> "+y
vmap <C-x> "+d
imap <C-v> <esc>"+pa

" I hit shift k a lot when I mean to just hit k, for some reason
map <S-k> k

nnoremap <silent> <f12> :!ctags -R *<CR>

nnoremap <space> za

" Quick save and loading of sessions
nnoremap <F7> :mksession! ./.vim_session<cr>
nnoremap <F8> :source ./.vim_session<cr>

nnoremap ! :!
nnoremap q: :q

vnoremap <C-h> y:call Preserve("%s/<C-r>"//g")<left><left><left><left>
vnoremap <C-f> y:grep <C-r>" %:p:h

nnoremap j gj
nnoremap k gk

nnoremap Q gqap

cmap <C-V> <C-R>+

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other neat stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When vimrc is edited, reload it
autocmd! bufwritepost $HOME/.vimrc source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/init.vim source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/vimrc source $MYVIMRC
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

" nnoremap <silent> <leader>= :call Preserve("FormatCode")<CR>
nnoremap <silent> <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>

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

" Format on save
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin: SirVer/ultisnips
" No customizations.

" Plugin: altercation/vim-colors-solarized
" No customizations.

" Plugin: gabesoft/vim-ags
" No customizations.

" Plugin: godlygeek/tabular

vmap <S-T> :Tab/\|<CR>

" Plugin: google/vim-codefmt
" Plugin: google/vim-glaive
" Plugin: google/vim-maktaba
" Plugin: ctrlpvim/ctrlp.vim

" Ignore the following files in ctrl-P
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.(git|hg|svn)|bin|obj|tmp|CMakeFiles)$',
    \ 'file': '\v((\.(exe|so|dll|bin|o|a|o.d|make|cbp))|CMakeCache.txt)$',
    \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore bin
    \ --ignore obj
    \ --ignore tmp
    \ --ignore CMakeFiles
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore .git5_specs
    \ --ignore review
    \ -g ""'
let g:ctrlp_root_markers = ['METADATA', 'Assets']
nnoremap <C-P> :CtrlPMRUFiles<CR>

" Plugin: nelstrom/vim-visual-star-search
" No customizations.

" Plugin: scrooloose/nerdtree

nnoremap <f2> :NERDTreeToggle<CR>
nnoremap <f3> :NERDTreeFocus<CR>
nnoremap <f4> :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=48

" Plugin: scrooloose/syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Plugin: tpope/vim-fugitive
" No customizations.

" Plugin: tpope/vim-repeat
" No customizations.

" Plugin: vim-scripts/Parameter-Text-Objects
" No customizations.

" Plugin: vim-scripts/a.vim

let g:alternateExtensions_h = "cc,cpp,cxx,c,mm,m"
let g:alternateExtensions_mm = "h"

" Plugin: vim-scripts/abolish.vim
" No customizations.

" Plugin: vim-scripts/bufexplorer.zip

" Do not show default help.
let g:bufExplorerDefaultHelp=0
" Sort by full file path name.
let g:bufExplorerSortBy='name'
nnoremap <C-b> :BufExplorer<cr>

" Plugin: vim-scripts/bufkill.vim
" No customizations.

" Plugin: vim-scripts/mru.vim

let MRU_Exclude_Files = '^/google/src/files/.*|^/tmp/.*|^/var/tmp/.*'
let MRU_Max_Entries = 500

nnoremap <leader>m :MRU<CR>

" Plugin: vim-scripts/surround.vim
" No customizations.

" Plugin: vim-scripts/tComment

nnoremap g/ :TComment<CR>
vnoremap g/ :TComment<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Java
autocmd Filetype java setlocal colorcolumn=101
autocmd Filetype objc,objcpp setlocal colorcolumn=101
