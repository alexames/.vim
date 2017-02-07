so ~/.vim/vimrc

set tabstop=2 " Tabs are 4 spaces
set shiftwidth=2 " Tab characters are 4 spaces
set softtabstop=2 " Soft tabs are 4 spaces

"""""""""""""""""""""""""""""""""""""""""""""
" NeoVim Options
"""""""""""""""""""""""""""""""""""""""""""""

if has("nvim")
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  " autocmd BufWinEnter,WinEnter term://* startinsert
endif

