#!/bin/bash

set -e

if [ $(which apt-get) ]; then
    sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev
elif [ $(which yum) ]; then
    sudo yum -y install gcc libffi-devel python-devel openssl-devel
fi

h=$HOME
virtualenv=virtualenv-15.1.0

curl https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/${virtualenv}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716 -o $h/${virtualenv}.tar.gz
tar xvzf $h/${virtualenv}.tar.gz -C $h

python2 $h/${virtualenv}/virtualenv.py $h/ansible 

source $h/ansible/bin/activate

pip install cryptography
pip install ansible

deactivate


