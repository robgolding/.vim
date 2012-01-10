set number
set lines=45 columns=115

set go-=m "remove menu bar
set go-=M "remove menu bar (don't even source the script)
set go-=T "remove toolbar
set go-=r "remove scrollbar

set showtabline=2

nnoremap <F3> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<cr>

set nomousehide

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

set t_vb=
