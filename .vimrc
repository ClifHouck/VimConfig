set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'andviro/flake8-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line 
"

set nowrap
syntax on
colorscheme elflord
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set ignorecase
set number
set nocursorline
set hlsearch
set ruler
let c_no_curly_error=1
set laststatus=2

" Provide visual alert past 80 characters.
set colorcolumn=80

" Automatically strip whitespace from the end of a line for Python files
autocmd BufWritePre *.py :%s/\s\+$//e

" statusline
" " cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" " format markers:
" "   %< truncation point
" "   %n buffer number
" "   %f relative path to file
" "   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
" "   %r readonly flag [RO]
" "   %y filetype [ruby]
" "   %= split point for left and right justification
" "   %-35. width specification
" "   %l current line number
" "   %L number of lines in buffer
" "   %c current column number
" "   %V current virtual column number (-n), if different from %c
" "   %P percentage through buffer
" "   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes', 'flake8']
