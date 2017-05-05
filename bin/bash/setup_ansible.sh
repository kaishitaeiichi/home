#!/bin/bash

set -e
this_dir=$(readlink -f $0 | xargs -I{} dirname {})

if [ $(which apt-get) ]; then
    sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev
elif [ $(which yum) ]; then
    sudo yum -y install gcc libffi-devel python-devel openssl-devel
elif [ -e /cygdrive/c ]; then
    if [ ! $(which apt-cyg) ]; then
        $(readlink -f $0 | xargs -I{} dirname {})/setup_apt-get.sh     
    fi

    apt-cyg install wget
    apt-cyg install gcc-core

    apt-cyg install python-devel
    apt-cyg install python-cffi
    apt-cyg install python-cryptography
    apt-cyg install python-openssl

    apt-cyg install libffi-devel
    apt-cyg install libcrypt-devel
    apt-cyg install openssl-devel
fi

h=$HOME
virtualenv=virtualenv-15.1.0

if [ -e $h/ansible ]; then
    rm -fr $h/ansible
fi

if [ ! -e $virtualenv ]; then
    $this_dir/setup_virtualenv.sh     
fi

python2 $h/${virtualenv}/virtualenv.py $h/ansible 

source $h/ansible/bin/activate

if [ ! $(grep '#ifndef u_int' /usr/include/sys/time.h) ]; then
    echo '#ifndef u_int'               | xargs -I{} sed -i '102a {}' /usr/include/sys/time.h
    echo 'typedef unsigned int u_int;' | xargs -I{} sed -i '102a {}' /usr/include/sys/time.h
    echo '#endif'                      | xargs -I{} sed -i '102a {}' /usr/include/sys/time.h
fi

pip install cryptography
pip install ansible

deactivate


