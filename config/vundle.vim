set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" General
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'

" Web Development
Bundle 'mattn/zencoding-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'gregsexton/MatchTag'

" Ruby/Rails
Bundle 'nelstrom/vim-textobj-rubyblock'
  Bundle 'kana/vim-textobj-user'
  runtime macros/matchit.vim

" Colorscheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'nelstrom/vim-blackboard'
Bundle 'nelstrom/vim-mac-classic-theme'

" Chinese Documentation
Bundle 'syncwork/vim-cndoc'

filetype plugin indent on
