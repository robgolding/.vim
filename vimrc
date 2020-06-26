set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'elixir-editors/vim-elixir'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'morhetz/gruvbox'
Plugin 'sheerun/vim-polyglot'
Plugin 'hashivim/vim-terraform'

call vundle#end()

filetype plugin indent on
syntax on

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
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nospell
set lazyredraw

set wrap
set textwidth=79
set formatoptions=qrn1t

set list
set listchars=tab:▸\ ,eol:¬

set updatetime=100

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

map <leader>f :Files<CR>
map <leader>b :Buffers<CR>

let g:ackprg = 'fd'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>k :lclose<CR>:copen<CR> " kquikfix list!
nnoremap <Leader>l :cclose<CR>:lopen<CR> " loclist
nnoremap <Leader>cc :cclose<CR>:lclose<CR> " close everything

nnoremap <leader>t1 yypVr=
nnoremap <leader>t2 yypVr-
nnoremap <leader>t3 yypVr^
nnoremap <leader>t4 yypVr"
nnoremap <leader>tt yypVr=yykPjj

nnoremap <leader>m :!cd `dirname %` && make<CR>

nnoremap <leader>q gqip

nnoremap <leader>v V`]

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>eg :e ~/.gvimrc<cr>

nnoremap <leader>wc :w<cr> :!detex % \| wc -w<cr>

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

set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" let g:solarized_hitrail=1
" colorscheme solarized
colorscheme gruvbox
set background=dark
set colorcolumn=80
set t_Co=256

set guifont=Menlo-Regular:h14

nnoremap <leader>gs :!git status<cr>
nnoremap <leader>gd :!git diff<cr>

""""""""""""""""""""""""""""""""
"" From the 'ultimate .vimrc'
"" http://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""

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

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %y\ format:\ %{&ff}\ %w%=%{fugitive#statusline()}\ \ Line:\ %l/%L:%c

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
" => JS section
""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""
" => Gundo
""""""""""""""""""""""""""""""
noremap <leader>h :GundoToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.o,*.obj,.git,*.pyc,*.aux,*.toc,*.log

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>M mmHmt:%s/<C-V><cr>//e<cr>'tzt'm
noremap <leader>W mmHmt:%s/\s\+$//e<cr>:let @/=''<CR>'tzt'm

if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.less set filetype=less

  " Automatically compile coffeescripts
  autocmd BufWritePost *.coffee silent make!

  " Save position in buffers when switching
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
let g:yankring_history_file = '.yankring_history'
let g:yankring_zap_keys = 'f F t T / ?'

let g:Powerline_symbols = 'unicode'

map <leader>g :YcmCompleter GoTo<CR>

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

let g:ale_linters = {
\   'python': ['pylint', 'isort'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'python': ['black', 'isort'],
\}

let g:python_black_executable = '/Users/robgolding/.local/bin/black'
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_python_black_options = '--single-quote'
let g:ale_python_pylint_change_directory = 0

" make pretty!
map <leader>p :ALEFix<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:terraform_fmt_on_save = 1

if expand('%:t') =~?'bash-fc-\d\+'
  setfiletype sh
endif

silent! source ~/.vimrc.override
