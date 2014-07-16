if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
verbose
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
au BufRead,BufNewFile *.rst.tmpl set filetype=rst
filetype plugin indent on
set autoindent
set modeline
set number
set ruler
set showcmd
autocmd FileType text setlocal textwidth=78

colorscheme zellner

set keywordprg=trs\ {en=it}
