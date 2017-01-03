#!/bin/bash

# https://github.com/mhbashari/Install-Python3.4-on-Ubuntu-16.04
sudo apt-get -y install build-essential checkinstall
sudo apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get -y install libssl-dev openssl
#sudo apt -y install lzma lzma-dev liblzma-dev

curl https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz -o /tmp/Python-3.6.0.tgz
cd /tmp
tar xzvf Python-3.6.0.tgz
cd Python-3.6.0
./configure --prefix=$HOME/python3
make
make install


