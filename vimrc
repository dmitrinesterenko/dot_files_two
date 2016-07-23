map - dd p
map _ dd kk p
set tw=80
set tabstop=2
set number
set expandtab
set directory=$HOME/.vim/swapfiles//

let mapleader="\<Space>"

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:ackprg = '<leader>a'
let g:ag_working_path_mode="r"
nnoremap <leader>a :Ag

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
nnoremap <leader>sv :source $MYVIMRC<cr> :wq<cr>
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
nnoremap \\ :NERDTreeToggle<CR>
nnoremap <Up>    2<C-w>+
nnoremap <Down>  2<C-w>-
nnoremap <Left>  2<C-w><
nnoremap <Right> 2<C-w>>
nnoremap t :tabnew<CR>
nnoremap [ :tabprevious<CR>
nnoremap ] :tabnext<CR>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader><leader> ikeyboard();<CR><ESC>

inoremap jk <esc>
inoremap <esc> <nop>

iabbrev adn and
iabbrev waht what
iabbrev tehn then
autocmd BufWrite,Bufread *.html :normal gg=G
autocmd BufNewFile,Bufread *.html setlocal nowrap
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
augroup cursorLineAndColumn
  autocmd!
  autocmd WinLeave * set nocursorline nocursorcolumn
  autocmd WinEnter * set cursorline cursorcolumn
  set cursorcolumn cursorline
augroup END

augroup toggleInsertMode " {{{
  autocmd!
  autocmd insertEnter * hi CursorColumn ctermbg=darkred
  autocmd insertLeave * hi CursorColumn ctermbg=233
augroup END
"}}}

augroup trailingWhiteSpace
  autocmd!
  autocmd BufWritePre * try | %s/ \+$// | catch | | endtry
augroup END

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>\:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gvomap s :normal vs<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" let g:ackprg = 'ag --vimgrep'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

map <leader>. :call RunNearestTest()<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END


