"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/eiichi/.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/eiichi/.vim')
  call dein#begin('/home/eiichi/.vim')

  " Let dein manage dein
  " Required:
  call dein#add('/home/eiichi/.vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


set number
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent

