set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
let g:go_fmt_command = "gofumpt"

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'psf/black'

" Linting is too aggressive 
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Make YCM compatible with Ultisnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_auto_trigger=0

" Snippets Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<Right>"
let g:UtliSnipsJumpBackwardTrigger="<Left>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/snippets"
let g:UltiSnipsEditSplit="vertical"

set completeopt-=preview

" autocmd FileType go UltiSnipsAddFiletypes go

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
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

let &runtimepath.=',~/.vim/bundle/ale'
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
colorscheme slate
highlight visual cterm=reverse ctermbg=green
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

" Automatically strip whitespace from the end of a line for Restructered text files
autocmd BufWritePre *.rst :%s/\s\+$//e

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

" Give us a local leader 
let maplocalleader = '\'
" Tiltfiles are a dialect of Python
autocmd BufNewFile,BufRead Tiltfile set ft=python
autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile
" Let us pipe python code through yapf for us.
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>s :!echo test<CR>

" Ale options
let g:ale_python_pylint_options='--disable=R0201,W0212'

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
