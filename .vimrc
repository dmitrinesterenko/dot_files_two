map - dd p
map _ dd k p

set tw=80
set tabstop=2
set number

let mapleader="\<Space>"

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.beam

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

set guicursor=n-v-c:block-Cursor
set guicursor=i:block-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

execute pathogen#infect()

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>w :w<cr>
nnoremap L $
nnoremap H 0
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

inoremap jk <esc>
inoremap <esc> <nop>

iabbrev adn and
iabbrev waht what
iabbrev tehn then
autocmd BufWrite,Bufread *.html :normal gg=G
autocmd BufNewFile,Bufread *.html setlocal nowrap
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
