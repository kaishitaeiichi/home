#!/bin/bash

h=$HOME
tmp=$h/home_git_tmp

find $tmp | grep -v -P '^'"$tmp"'$' | xargs -I{} mv -v -n {} $h


curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh $h/.vim

cat <<EOF > $h/.vimrc
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$h/.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$h/.vim')
  call dein#begin('$h/.vim')

  " Let dein manage dein
  " Required:
  call dein#add('$h/.vim/repos/github.com/Shougo/dein.vim')

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

EOF

cat <<EOF >> $h/.vimrc

set number
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent

EOF


