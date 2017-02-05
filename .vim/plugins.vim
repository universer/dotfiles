filetype off                "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'derekwyatt/vim-scala'
Plugin 'asins/vimcdoc'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'file:///Users/yichen/.vim/bundle/vim-peepopen'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/taglist.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/vim-operator-highlight'
Plugin 'vim-scripts/TagHighlight'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'danro/rename.vim'

call vundle#end()            " required
filetype plugin indent on    " required

