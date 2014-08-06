set number
set lines=45 columns=115

set go-=m "remove menu bar
set go-=M "remove menu bar (don't even source the script)
set go-=T "remove toolbar
set go-=r "remove scrollbar

set background=light

set guifont=Menlo\ Regular\ for\ Powerline:h12
set antialias

nnoremap <F3> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<cr>

set nomousehide

"highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=darkred

"match ExtraWhitespace /\s\+\%#\@<!$/

set t_vb=

autocmd! bufwritepost .vimrc source % source ~/.gvimrc
autocmd! bufwritepost vimrc source % source ~/.gvimrc
autocmd! bufwritepost .gvimrc source %
autocmd! bufwritepost gvimrc source %

silent! source ~/.gvimrc.override
