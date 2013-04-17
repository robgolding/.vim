"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
call pathogen#infect()

if has("autocmd")
    filetype plugin indent on
endif

syntax enable

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number

set mouse=a

set encoding=utf8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nospell

set wrap
set textwidth=79
set formatoptions=qrn1t

set list
set listchars=tab:▸\ ,eol:¬

let mapleader=","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
map <tab> %

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Retrain those fingers!
"nnoremap ; :
inoremap jj <ESC>

nnoremap Y y$

nnoremap <C-Tab> <C-PageDown>
nnoremap <C-S-Tab> <C-PageUp>

"nnoremap <C-t> :CommandT <CR>
nnoremap <C-t> :CtrlP <CR>
nnoremap <leader>, :tabnew <CR>

nnoremap <leader>t1 yypVr=
nnoremap <leader>t2 yypVr-
nnoremap <leader>t3 yypVr^
nnoremap <leader>t4 yypVr"
nnoremap <leader>tt yypVr=yykPjj

nnoremap <leader>m :!cd `dirname %` && make<CR>
nnoremap <leader>b :w<CR> :!~/university/notes/build<CR>

nnoremap <leader>q gqip

nnoremap <leader>v V`]

nnoremap <leader>ev :tabe ~/.vimrc<cr>
nnoremap <leader>eg :tabe ~/.gvimrc<cr>

nnoremap <leader>wc :w<cr> :!detex % \| wc -w<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>
nnoremap <leader>- :11b<cr>
nnoremap <leader>= :12b<cr>
nnoremap <leader><bs> :13b<cr>
nnoremap <leader><home> :14b<cr>

nnoremap <leader>r :syntax sync fromstart<cr>

nnoremap <F2> :set nonumber!<cr>:set foldcolumn=0<cr>
nnoremap <F9> :NERDTreeToggle<cr>
inoremap <F9> :NERDTreeToggle<cr>
vnoremap <F9> :NERDTreeToggle<cr>

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

let g:solarized_hitrail=1
colorscheme solarized
set background=dark
set colorcolumn=80
set t_Co=256

nnoremap <leader>gs :!git status<cr>
nnoremap <leader>gd :!git diff<cr>

""""""""""""""""""""""""""""""""
"" From the 'ultimate .vimrc'
"" http://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost vimrc source ~/.vimrc

if has("gui_running")
endif

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry


" Map space to / (search) and c-space to ? (backwards search)
map <space> /
map <c-space> ?
nnoremap <silent> <leader><space> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Moving around tabs
map <c-up> :bp<cr>
map <c-down> :bn<cr>

map <c-left> :tabprevious<cr>
map <c-right> :tabnext<cr>

map <c-s-left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
map <c-s-right> :execute 'silent! tabmove ' . (tabpagenr())<CR>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %y\ format:\ %{&ff}\ %w%=%{fugitive#statusline()}\ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.html set syntax=htmldjango
au BufNewFile,BufRead *.mako set ft=mako

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc,*.aux,*.toc,*.log
noremap <leader>y :CommandTFlush<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>M mmHmt:%s/<C-V><cr>//e<cr>'tzt'm
noremap <leader>W mmHmt:%s/\s\+$//e<cr>:let @/=''<CR>'tzt'm

" => Gist plugin

let g:github_user = 'robgolding63'
let g:github_token = '68a009327e3d6fc28dd528f15486fcaa'

if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
let g:yankring_history_file = '.yankring_history'

let g:Powerline_symbols = 'fancy'

let g:jedi#show_function_definition = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

if expand('%:t') =~?'bash-fc-\d\+'
  setfiletype sh
endif

silent! source ~/.vimrc.override
