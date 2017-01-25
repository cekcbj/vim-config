Bundle 'scrooloose/nerdtree'

let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=3
let NERDTreeShowHidden=1

" use `<leader>o` to open the current file in NERDTree
nmap <leader>o :NERDTreeFind<CR>
nmap <c-e> :NERDTreeToggle<CR>
