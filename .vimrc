call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-scala'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-bufferline'
Plug 'Lokaltog/vim-easymotion'
Plug 'tomasr/molokai'
Plug 'wlangstroth/vim-racket'
Plug 'fatih/vim-go'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

filetype indent on
filetype plugin on
syntax on

set nocompatible
set title
set ruler
set number
set esckeys
set hlsearch
set showmode
set showmatch
set expandtab
set tabstop=2
set scrolloff=2
set shiftwidth=2
set softtabstop=2
set encoding=UTF-8
set fileencodings=UTF-8
set backspace=eol,start,indent
set cursorline
set laststatus=2
set ttimeoutlen=50

colorscheme molokai

map j gj
map k gk
"map <Up> <NOP>
"map <Down> <NOP>
"map <Left> <NOP>
"map <Right> <NOP>
"imap <Up> <NOP>
"imap <Down> <NOP>
"imap <Left> <NOP>
"imap <Right> <NOP>

nmap <F8> :TagbarToggle<CR>

" easymotion
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)")

imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

cabbrev E Explore

if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 

  autocmd BufEnter * let &titlestring = expand("%:t") . " :: vim"
endif

" python
au Bufenter *.py map <F5> :!python %<CR>

" c
au Bufenter *.c map <F5> :!gcc % -lm && ./a.out<CR>

" cpp
au Bufenter *.cpp map <F5> :!g++ % -lm && ./a.out<CR>

" ruby
au Bufenter *.rb map <F5> :!ruby %<CR>

" js
au Bufenter *.js map <F5> :!node %<CR> 

" rkt
au Bufenter *.rkt map <F5> :!racket %<CR>

" nerdTree
map <C-n> :NERDTreeToggle<CR>
