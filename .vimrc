
set tabstop=4 softtabstop=4
" set shiftwidth=4
" set expandtab
set smartindent


set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
" set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and por user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c


" Adding plugins
" (Plugins will be downloaded under the specified directory.)
call plug#begin('~/.vim/plugged')





Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'

Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

call plug#end()



set nocp
syntax enable
filetype plugin on


colorscheme gruvbox
set background=dark


if executable('rg')
	let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-staged']


let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0


"""" Window """" 


"The next 8 commands are the same, but for arrows and hjkl"

nnoremap <leader>l :wincmd l <CR>
nnoremap <leader> <Left> :wincmd h <CR>
nnoremap <leader> <Down> :wincmd j <CR>
nnoremap <leader> <Up> :wincmd k <CR>
nnoremap <leader> <Right> :wincmd l <CR>


nnoremap <leader>h :wincmd h <CR>
nnoremap <leader>j :wincmd j <CR>
nnoremap <leader>k :wincmd k <CR>
nnoremap <leader>l :wincmd l <CR>
"----"

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v <bar> :Ex  <bar> : vertical resize 30<CR>
nnoremap <Leader>ps :Rg <SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

""""Doesn't work at the moment (TODO: Find an alternative)""""""
" nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
" nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>


""""MAYBE LATER I'LL IMPLEMENT IT"""

" fun! TrimWhitespace()
"     let l:save = winsaveview()
"     keeppatterns %s/\s\+$//e
"     call winrestview(l:save)
" endfun

" augroup gui1612
"     autocmd!
"     autocmd BufWritePre * :call TrimWhitespace()
" augroup END


set runtimepath^=~/.vim/bundle/ctrlp.vim
