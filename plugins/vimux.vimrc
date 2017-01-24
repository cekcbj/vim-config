Bundle 'benmills/vimux'
function VimuxRunCurrentFile()
  if &filetype ==? 'python'
    execute 'call VimuxRunCommand("python '.expand('%:p').'")'
  elseif &filetype ==? 'javascript' || &filetype ==? 'javascript.jsx'
    execute 'call VimuxRunCommand("node '.expand('%:p').'")'
  elseif &filetype ==? 'ruby'
    execute 'call VimuxRunCommand("ruby '.expand('%:p').'")'
  elseif &filetype ==? 'sh'
    execute 'call VimuxRunCommand("'.expand('%:p').'")'
  endif
endfunction

" use <leader>r to run current file in a tmux panel
nmap <leader>r :call VimuxRunCurrentFile()<cr>
" use <leader>l to run last tmux command
nmap <leader>l :VimuxRunLastCommand<cr>
