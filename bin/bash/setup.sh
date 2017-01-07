#!/bin/bash

# curl https://raw.githubusercontent.com/kaishitaeiichi/home/master/bin/bash/setup.sh | bash

h=$HOME
tmp=$HOME/home_git_tmp

ohters=()
while [ $# -gt 0 ]; do
    case "$1" in
        "-h") h="$2"; shift 2;; 
        "-t") tmp="$2"; shift 2;; 
        *) others[$i]=$1; i=$((i + 1)); shift 1;; 
    esac 
done 

mkdir -p -v $h
mkdir -p -v $tmp

git clone https://github.com/kaishitaeiichi/home.git $tmp

find $tmp -mindepth 1 -type d | sed "s;$tmp/;;g" | xargs -I{} mkdir -p -v $h/{}
find $tmp -mindepth 1 -type f | sed "s;$tmp/;;g" | xargs -I{} cp -p -v $tmp/{} $h/{}




