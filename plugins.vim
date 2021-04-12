filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" file manager
Plugin 'preservim/nerdtree'
" search file manager
Plugin 'kien/ctrlp.vim'
"Plugin 'tpope/vim-vinegar'
Plugin 'morhetz/gruvbox'
" Syntax Checking
Plugin 'dense-analysis/ale'
" allow to run ag from vim
Plugin 'rking/ag.vim'
" vim snipmate and it dependences
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'

Plugin 'ycm-core/YouCompleteMe'

" SQL syntax"
Plugin 'shmup/vim-sql-syntax'

" All of your Plugins must be added before the following line
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
" see :h vundle for more details or wiki for FAQ Put your non-Plugin stuff after this line
