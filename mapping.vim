" mapping for other application
nnoremap > :><CR>
nnoremap < :<<CR>

" Visual tabbing
vnoremap > :><CR>gv
vnoremap < :<<CR>gv

nmap <silent> <cr> :noh<cr><cr>

nmap <silent> <space>w :w<cr>
nmap <silent> <space>W :wa<cr>

nmap <silent> <BS> "_
nmap <silent> \ "+
vmap <silent> <BS> "_
vmap <silent> \ "+

" nmap <silent> x "_x
" vmap <silent> x "_x

nmap <silent> <C-j> <C-d>zz
nmap <silent> <C-k> <C-u>zz

vmap <silent> <C-j> <C-d>zz
vmap <silent> <C-k> <C-u>zz
