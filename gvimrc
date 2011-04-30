set number
set lines=53 columns=125

set go-=T
set showtabline=2

nnoremap <F3> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<cr>

set nomousehide

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/
