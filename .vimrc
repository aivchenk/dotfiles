
inoremap jk <ESC>

filetype plugin indent on
syntax on
set encoding=utf-8
set wildmenu
vnoremap . :normal .<cr>


set hlsearch
set ignorecase
set smartcase
set incsearch
nnoremap <CR> :noh<CR><CR>

set laststatus=2 " Always show the status line
set novisualbell " Don't ring the bell
set ruler " Always show current positions along the bottom

let &t_Co=256
colorscheme molokai
let g:molokai_original = 0
let g:rehash256 = 1

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif
