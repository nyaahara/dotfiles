""""""""""""""""""""""""""""""
" Setting up plugins
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" opening files conviniently
Plug 'Shougo/unite.vim'
" It can show recently opening files
Plug 'Shougo/neomru.vim'

call plug#end()
""""""""""""""""""""""""""""""


au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge
  %s/  /  /ge
  call setpos(".", cursor)
  unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()


"カーソル行をハイライト
set cursorline

"カレントウィンドウに罫線
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

"Escの2回押しでハイライト消去
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
"
set softtabstop=0

set number
