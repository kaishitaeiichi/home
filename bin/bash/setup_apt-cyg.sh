#!/bin/bash

curl https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg -o /usr/local/bin/apt-cyg
chmod 744 /usr/local/bin/apt-cyg

apt-cyg mirror http://ftp.jaist.ac.jp/pub/cygwin/

