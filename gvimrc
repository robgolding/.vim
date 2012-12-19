set number
set lines=60 columns=115

set go-=m "remove menu bar
set go-=M "remove menu bar (don't even source the script)
set go-=T "remove toolbar
set go-=r "remove scrollbar

set guifont=Monaco\ for\ Powerline:h14
set antialias

set showtabline=2

nnoremap <F3> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<cr>

set nomousehide

"highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=darkred

"match ExtraWhitespace /\s\+\%#\@<!$/

set colorcolumn=79

set t_vb=
