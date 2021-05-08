" This is the vimrc file for use across all computers I use.
" Changes specific to a specific computer should go in ~/.vimrc.

set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" required: This must go first.
filetype off

""""""""""""""""""""""""""""""""""""""""
" vim-plug automatic installation
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Basic stuff.
Plug 'tpope/vim-sensible'                 " Sensible default settings.
Plug 'vim-airline/vim-airline'            " Status bar configuration.
Plug 'vim-airline/vim-airline-themes'     " Status bar color themes.

" Colorschemes
Plug 'ghifarit53/tokyonight-vim'
Plug 'joshdick/onedark.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'rakr/vim-one'

" Utility libraries, prereq for other libraries.
Plug 'google/vim-maktaba'                 " Maktaba is a vimscript plugin library. It is designed for plugin authors.
Plug 'google/vim-glaive'                  " Glaive is a utility for configuring maktaba plugins.
Plug 'kana/vim-textobj-user'              " Helps define custom text objects. Needed for parameter text objects below.

" IDE Feature integrations.
Plug 'tpope/vim-fugitive'                 " Git integration.
Plug 'airblade/vim-gitgutter'             " Git in-file line changes.
Plug 'ilyachur/cmake4vim'                 " CMake integration.
Plug 'google/vim-codefmt'                 " clang-format integration.
Plug 'puremourning/vimspector'            " GDB integration.
Plug 'ycm-core/YouCompleteMe', { 'do' : './install.py --clangd-completer' }
                                          " Language-semantic-aware autocompletion and other features.

" Filesystem navigation.
Plug 'scrooloose/nerdtree'                " A file system explorer for the Vim editor.
Plug 'vim-scripts/a.vim'                  " A few of quick commands to swtich between source files and header files quickly.
Plug 'vim-scripts/bufkill.vim'            " This is a script to unload, delete or wipe a buffer without closing the window.

" Editor improvement plugins.
Plug 'nelstrom/vim-visual-star-search'    " Select text in visual mode and then hit * and # to search for it elsewhere.
Plug 'tpope/vim-obsession'                " Make managing vim session easier.
Plug 'tpope/vim-repeat'                   " Repeat.vim remaps . in a way that plugins can tap into it.
Plug 'sgur/vim-textobj-parameter'         " This script defines a parameter text object.
Plug 'vim-scripts/abolish.vim'            " Improved case sensitive substitution and variable name coercion.
Plug 'vim-scripts/surround.vim'           " Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more.
Plug 'vim-scripts/tComment'               " Filetype aware comment toggle.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                   " Fuzzy Finder functionality for buffers, history, files, etc.

" Additional utilities.
Plug 'godlygeek/tabular'                  " Table alignment plugin.

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Options                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark        " Use the dark colorscheme instead of the light one.
colorscheme onedark
let g:airline_theme='onedark'

set title                  " Sets the titlebar of the terminal to be the name of the file.
set hidden                 " Hides buffers rather than closing them when opening a new buffer.
set nolazyredraw           " Don't redraw while executing macros.
set noshowmode
set cursorline             " Highlight the line the cursor is on.
set magic                  " All characters except /[a-zA-Z0-9_]/ use their special meaning
set history=1000           " Increases the command history.
set nowrap                 " Forces lines to not wrap.
set noerrorbells           " Does not make a sound when there is an error.
set whichwrap+=<,>,h,l     " Backspace config.
set scrolloff=2            " ensures the cursor never reaches the bottom of the window.
set smartindent            " Intelligently guess the indentation level of the next line.
set relativenumber         " Shows relative line numbers, making linewise motions easier.
set number                 " Display the absolute line number for the current line.
set formatoptions-=t       " Don't wrap to new lines at 80 characters automatically.
set noswapfile             " Disable swap files. I save often enough that these just get in the way.
set grepprg=grep\ -rnH\ $* " sets GNU grep to be the program to run when searching.
                           "   -r: recursive by default
                           "   -n: show line numbers
                           "   -H: show filenames
set mouse=""               " what the mouse pointer looks like in different modes.
set guioptions=rLte        " Remove menu bar when using a GUI (gvim).
set list                   " Visible whitespace, displayed using listchars below.
set listchars=tab:\ \ ┊,
             \space:·,
             \trail:•,
             \extends:…,
             \precedes:…,
             \nbsp:.,
             \eol:$,
set colorcolumn=81         " Put a line at 80 characters.
                           " But java and Objective-C should be set to 101.
autocmd Filetype java setlocal colorcolumn=101
autocmd Filetype objc,objcpp setlocal colorcolumn=101

" Searching options
set hlsearch               " Highlight search results.
set ignorecase             " Ignore the case when searching strings.
set smartcase              " Ignore the ignorecase option if search pattern contains uppcase letters.

" Tab settings
set expandtab              " Tab key creates spaces instead of tabs.
set tabstop=2              " Tabs are 2 spaces.
set shiftwidth=2           " Tab characters are 2 spaces.
set softtabstop=2          " Soft tabs are 2 spaces.

" Fold settings
set foldenable
set foldmethod=syntax
set foldlevel=1000

set updatetime=100
set signcolumn=number

" When vimrc is edited, reload it.
autocmd! bufwritepost $HOME/.vimrc source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/vimrc source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/keybinds.vim source $MYVIMRC
autocmd! bufwritepost $VIM/vimfiles/vimrc source $MYVIMRC

" Files that can not be written should not be modifiable.
autocmd! BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if &ro | set nomodifiable | endif
autocmd! BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if !&ro | set modifiable | endif

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Keybinds                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vim/keybinds.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Plugins Options                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Plugin 'ilyachur/cmake4vim'

let g:cmake_compile_commands=1
let g:cmake_compile_commands_link=1
let g:cmake_vimspector_support=1

""""""""""""""""""""""""""""""""""""""""
" Plugin 'ctrlpvim/ctrlp.vim'
"
" " Ignore the following files in ctrl-P
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v(\.git|\.hg|\.svn|bin|obj|tmp|build|CMakeFiles)',
"     \ 'file': '\v((\.(exe|so|dll|bin|o|a|o.d|make|cbp)$)|CMakeCache.txt)',
"     \ }
"
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"     \ --ignore .git
"     \ --ignore .svn
"     \ --ignore .hg
"     \ --ignore bin
"     \ --ignore obj
"     \ --ignore tmp
"     \ --ignore CMakeFiles
"     \ --ignore cmake-build-*
"     \ --ignore .DS_Store
"     \ --ignore "**/*.pyc"
"     \ --ignore .git5_specs
"     \ --ignore review
"     \ -g ""'
"
" " This sets additional root markers.
" " The defaults are .git, .hg, .svn, .bzr, and _darcs
" let g:ctrlp_root_markers = ['METADATA', 'Assets']

""""""""""""""""""""""""""""""""""""""""
" Plugin 'scrooloose/nerdtree'

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=48

""""""""""""""""""""""""""""""""""""""""
" Plugin 'vim-scripts/a.vim'

let g:alternateExtensions_h = "cc,cpp,cxx,c,mm,m"
let g:alternateExtensions_mm = "h"

""""""""""""""""""""""""""""""""""""""""
" Plugin 'vim-scripts/bufexplorer.zip'
"
" let g:bufExplorerDefaultHelp=0 " Do not show default help.
" let g:bufExplorerSortBy='name' " Sort by full file path name.

""""""""""""""""""""""""""""""""""""""""
" Plugin 'vim-scripts/mru.vim'
"
" let MRU_Exclude_Files = '\v
"       \^/google/src/files/.*|
"       \^/tmp/.*|
"       \^/var/tmp/.*|
"       \^/usr/include/.*|
"       \.*COMMIT_EDITMSG|
"       \.*MERGE_MSG'
"
" let MRU_Max_Entries = 500
"
