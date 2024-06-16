" mapping for other application
nmap <silent> <expr> > :><cr>
nmap <silent> <expr> < :<<cr>

vmap <silent> <expr> > :><cr>gv
vmap <silent> <expr> < :<<cr>gv

nmap <silent> <cr> :noh<cr><cr>

nmap <silent> <space>w :w<cr>
nmap <silent> <space>W :wa<cr>

nmap <silent> <BS> "_
nmap <silent> \ "+
vmap <silent> <BS> "_
vmap <silent> \ "+

nmap <silent> <C-j> <C-d>zz
nmap <silent> <C-k> <C-u>zz

vmap <silent> <C-j> <C-d>zz
vmap <silent> <C-k> <C-u>zz
