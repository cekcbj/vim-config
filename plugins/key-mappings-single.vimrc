" leader
map <space> \

" resize
nnoremap <Left>  :vertical resize -20
nnoremap <Right> :vertical resize +20
nnoremap <Up>    :resize +20
nnoremap <Down>  :resize -20

" Use ; as :
nnoremap ; :

" Search by default is global, when we use g, we actually toggled it
nnoremap / /\V
vnoremap / /\V

" S to split
nnoremap S i<CR><Esc>

" quick search do not make move, only search and high light
nnoremap # g*N
vnoremap # y/<C-R>"<CR>N

" make Y compatible with D
nnoremap Y y$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" MOTION
noremap j gj
noremap k gk

" goes to the last non-whitespace character
noremap 0 ^
noremap ) g_
