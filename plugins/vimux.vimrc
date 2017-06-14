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
  elseif &filetype ==? 'java'
    execute 'call VimuxRunCommand("javac '.expand('%:p').' && java -ea '.expand('%:r').'")'
  endif
endfunction

" use <leader>r to run current file in a tmux panel
nmap <leader>r :call VimuxRunCurrentFile()<cr>
" use <leader>l to run last tmux command
nmap <leader>l :VimuxRunLastCommand<cr>

function VimuxRunTestCurrentFile()
  if &filetype ==? 'javascript' || &filetype ==? 'javascript.jsx'
    execute 'call VimuxRunCommand("npm test '.expand('%:p').'")'
  endif
endfunction

nmap <leader>t :call VimuxRunTestCurrentFile()<cr>

function VimuxRunTestAllFiles()
  if &filetype ==? 'javascript' || &filetype ==? 'javascript.jsx'
    execute 'call VimuxRunCommand("npm test")'
  endif
endfunction

nmap <leader>T :call VimuxRunTestAllFiles()<cr>
