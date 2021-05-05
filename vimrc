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
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" required: This must go first.
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'                    " Let Vundle manage Vundle.
Plugin 'altercation/vim-colors-solarized' " Solarized Colorscheme for Vim.

" Utility library, prereq for other libraries.
Plugin 'google/vim-glaive'  " Maktaba is a vimscript library for plugin authors.
Plugin 'google/vim-maktaba' " Maktaba is a vimscript plugin library. It is designed for plugin authors.

" IDE Feature integrations.
Plugin 'gabesoft/vim-ags'        " Silver searcher (AG) integration.
Plugin 'google/vim-codefmt'      " clang-format integration.
Plugin 'ilyachur/cmake4vim'      " CMake integration.
Plugin 'puremourning/vimspector' " GDB integration.
Plugin 'tpope/vim-fugitive'      " Git integration.
Plugin 'SirVer/ultisnips'        " Snippets.
Plugin 'ycm-core/YouCompleteMe'  " Language-semantic-aware autocompletion and other features.

" Filesystem navigation.
Plugin 'scrooloose/nerdtree'         " A file system explorer for the Vim editor.
Plugin 'vim-scripts/a.vim'           " A few of quick commands to swtich between source files and header files quickly.
Plugin 'vim-scripts/bufexplorer.zip' " With bufexplorer, you can quickly and easily switch between buffers.
Plugin 'vim-scripts/mru.vim'         " The Most Recently Used (MRU) plugin.
Plugin 'ctrlpvim/ctrlp.vim'          " Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'vim-scripts/bufkill.vim'     " This is a script to unload, delete or wipe a buffer without closing the window.

" Editor improvement plugins.
Plugin 'nelstrom/vim-visual-star-search'     " Select text in visual mode and then hit * and # to search for it elsewhere.
Plugin 'tpope/vim-obsession'                 " Make managing vim session easier.
Plugin 'tpope/vim-repeat'                    " Repeat.vim remaps . in a way that plugins can tap into it.
Plugin 'tpope/vim-sensible'                  " Sensible defaults
Plugin 'vim-scripts/Parameter-Text-Objects'  " This script defines a parameter text object.
Plugin 'vim-scripts/abolish.vim'             " Improved case sensitive substitution and variable name coercion.
Plugin 'vim-scripts/surround.vim'            " Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more.
Plugin 'vim-scripts/tComment'                " Filetype aware comment toggle.

" Additional utilities.
Plugin 'godlygeek/tabular' " Table alignment plugin.

filetype plugin indent on  " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Options                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set whichwrap+=<,>,h,l

" ensures the cursor never reaches the bottom of the window
set scrolloff=2

" Tab settings
set tabstop=4 " Tabs are 4 spaces
set shiftwidth=4 " Tab characters are 4 spaces
set softtabstop=4 " Soft tabs are 4 spaces
set expandtab " Tab key creates spaces instead of tabs

set smartindent " Intelligently guess the indentation level of the next line

" Searching options
set ignorecase " Ignore the case when searching strings
set smartcase " Ignore the ignorecase option if search pattern contains uppcase letters

" Shows number along the left side
set number

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
" Is this necessary?
filetype plugin on

" sets GNU grep to be the program to run when searching
set grepprg=grep\ -rnH\ $*

" what the mouse pointer looks like in different modes
set mouse=""

" Remove menu bar
set guioptions=rLte

" Put a line at 80 characters
set colorcolumn=81

" Highlight search results
set hlsearch

" Disable swap files. I save often enough that these just get in the way.
set noswapfile

" When vimrc is edited, reload it
autocmd! bufwritepost $HOME/.vimrc source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/init.vim source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/vimrc source $MYVIMRC
autocmd! bufwritepost $VIM/vimfiles/vimrc source $MYVIMRC

" files that can not be written should not be modifiable
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if &ro | set nomodifiable | endif
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if !&ro | set modifiable | endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,longest

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
augroup END

" Give me relevant info in my status bar.
set statusline=
set statusline+=%f
set statusline+=\ %m
set statusline+=\ %=
set statusline+=\ %{ObsessionStatus()}
set statusline+=\ [CMake(%{g:cmake_build_target})]
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Keybinds                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/keybinds.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Plugins Options                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugin: ctrlpvim/ctrlp.vim

" Ignore the following files in ctrl-P
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.(git|hg|svn)$|bin|obj|tmp|build|CMakeFiles)',
    \ 'file': '\v((\.(exe|so|dll|bin|o|a|o.d|make|cbp)$)|CMakeCache.txt)',
    \ }

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore bin
    \ --ignore obj
    \ --ignore tmp
    \ --ignore CMakeFiles
    \ --ignore cmake-build-*
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore .git5_specs
    \ --ignore review
    \ -g ""'

let g:ctrlp_root_markers = ['METADATA', 'Assets']

" Plugin: scrooloose/nerdtree

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=48

" Plugin: vim-scripts/a.vim

let g:alternateExtensions_h = "cc,cpp,cxx,c,mm,m"
let g:alternateExtensions_mm = "h"

" Plugin: vim-scripts/bufexplorer.zip

" Do not show default help.
let g:bufExplorerDefaultHelp=0
" Sort by full file path name.
let g:bufExplorerSortBy='name'

" Plugin: vim-scripts/mru.vim

let MRU_Exclude_Files = '\v^/google/src/files/.*|^/tmp/.*|^/var/tmp/.*|/usr/include'
let MRU_Max_Entries = 500

" Plugin 'ycm-core/YouCompleteMe'

" let g:project_dir = getcwd()
" let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_global_ycm_extra_conf.py'
" let g:ycm_extra_conf_vim_data = ['g:project_dir']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Java
autocmd Filetype java setlocal colorcolumn=101
autocmd Filetype objc,objcpp setlocal colorcolumn=101
