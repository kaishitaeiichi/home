#!/bin/bash

# to use these commands:
#
# source with_menu.sh
#


#
# list to selected items.
#
function menu {

    local lines=()
    local i=0
    local IFS_0="$IFS"
    local num=""

    IFS=$'\n'
    while read -r line
    do
        if [ -p /dev/stdin ]; then
            lines[$i]="$line"
            i=$(($i + 1))
        fi 
    done < /dev/stdin
    IFS="$IFS_0"

    width=${#i}
    f="%${width}d %s %${width}d\n"
    for j in $(seq 0 $(($i - 1)))
    do
        printf "$f" $((j + 1)) "${lines[$j]}" $((j + 1)) > /dev/stderr
    done

    printf "enter number:" > /dev/stderr    
    read -r num < /dev/tty

    if [ ! "$num" ]; then
        return 1
    fi

    echo "${lines[$(($num - 1))]}"

}

#
# ce is cd which has history and menu.
#
function ce {

    local history_dir=~/.ce
    local history_file=$history_dir/history.txt

    if [ ! -e $history_dir ]; then
        mkdir $history_dir
        touch $history_file
    fi

    local to_dir="$(pwd)"
    local others=()
    local i=0
    local n=20
    local r='.*'
    local l=''
    while [ $# -gt 0 ]; do
        case "$1" in
            "-r") r="$2"; shift 2;; 
            "-n") n="$2"; shift 2;; 
            "-l") l="-l"; shift 1;; 
            *) others[$i]=$1; i=$((i + 1)); shift 1;; 
        esac 
    done 

    if [ ${others[0]} ]; then
        to_dir="${others[0]}"
    elif [ "$l" ]; then
        to_dir=$(ls | tail -n $n | grep -E "$r" | menu)
    else 
        to_dir=$(cat $history_file | tail -n $n | grep -E "$r" | menu)
    fi

    cd $to_dir
    pwd >> $history_file   


}


#
# vin is vim which has history and menu.
#
function vin {

    local history_dir=~/.vin
    local history_file=$history_dir/history.txt

    if [ ! -e $history_dir ]; then
        mkdir $history_dir
        touch $history_file
    fi

    local target_file=""
    local others=()
    local i=0
    local n=20
    local r='.*'
    local l=''
    while [ $# -gt 0 ]; do
        case "$1" in
            "-r") r="$2"; shift 2;; 
            "-n") n="$2"; shift 2;; 
            "-l") l="-l"; shift 1;; 
            *) others[$i]=$1; i=$((i + 1)); shift 1;; 
        esac 
    done 

    if [ ${others[0]} ]; then
        target_file="${others[0]}"
    elif [ "$l" ]; then
        target_file=$(find . -type f | tail -n $n | grep -E "$r" | menu)
    else 
        target_file=$(cat $history_file | tail -n $n | grep -E "$r" | menu)
    fi

#    if [ -e $target_file ]; then
#        target_file=$(readlink -f $target_file)
#    else
#        echo "$target_file is not found."
#        return 1    
#    fi

    vim $target_file
    target_file=$(readlink -f $target_file)
    echo $target_file >> $history_file

}


