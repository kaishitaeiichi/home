if &compatible
  set nocompatible
endif
set runtimepath+=~/dein.vim

call dein#begin('~/.vim/dein')

call dein#add('~/dein.vim')
call dein#add('Shougo/neocomplete.vim')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif


set number
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent



