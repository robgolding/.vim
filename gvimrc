set number
set lines=50 columns=100

set go-=m "remove menu bar
set go-=M "remove menu bar (don't even source the script)
set go-=T "remove toolbar
set go-=r "remove scrollbar

set guifont=Menlo:h13
set antialias

nnoremap <F3> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<cr>

set nomousehide

"highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=darkred

"match ExtraWhitespace /\s\+\%#\@<!$/

set t_vb=

silent! source ~/.gvimrc.override
