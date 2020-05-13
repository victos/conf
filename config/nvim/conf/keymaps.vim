"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>w <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP


" === NERDTree === "

"  <leader>e - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" window mapping
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wh <C-w>h
noremap <leader>wl <C-w>l
noremap <leader>wc <C-w>c
noremap <leader>ws <C-w>s
noremap <leader>wo <C-w>o
noremap <leader>w<SPACE> :split<CR>
noremap <leader>w<CR> :vsplit<CR>

" tab mapping
noremap <leader>tj :tabr<CR>
noremap <leader>tk :tabl<CR>
noremap <leader>th :tabp<CR>
noremap <leader>tl :tabn<CR>
noremap <leader>tc :tabc<CR>

" access system clipboard
nnoremap <leader>p "+gp
nnoremap <leader>c "+y
