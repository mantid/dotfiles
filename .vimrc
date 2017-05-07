" *****************
" Chris Minton 2017
" *****************
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " column indentation with > and <, automatic block indentation
set expandtab       " tabs are spaces
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set number          " Turn on line numbers
set autoread        " Autoload files that have changed outside of vim

set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace

" turn on syntax highlighting
filetype plugin indent on
syntax on

" allow powerline symbols
let g:Powerline_symbols = 'fancy'

" vim-plug plugin manager
" remember to run:
"  :source %
"  :PlugInstall
call plug#begin()
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
" NERD tree will be loaded on the first invocation of NERDTreeToggle
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:terraform_fmt_on_save = 1

" open NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
" open NERDTree on startup
" autocmd vimenter * NERDTree
" close NERDTree if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" use solarized colours
syntax enable
if has('gui_running')
    colorscheme solarized
    " set background=light
else
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    set background=dark
endif
colorscheme solarized
call togglebg#map("<F5>")

" set clipboard copy (use vim 7.4+)
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed
