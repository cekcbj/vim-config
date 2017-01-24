" use `R` as a replace operator
" EXAMPLE: `Rap` will replace the whole paragraph with the content in your
" register
Bundle 'Chun-Yang/vim-operator-replace'
nmap R <Plug>ReplaceOperator
vmap R <Plug>ReplaceOperator
nmap RR 0Rg$

nmap Rr <Plug>ReplaceOperatorWithLastReplaced
vmap Rr <Plug>ReplaceOperatorWithLastReplaced
nmap RrR 0Rrg$
