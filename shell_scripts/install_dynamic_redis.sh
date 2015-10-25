#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "run as root"
  exit
fi
cd /vagrant
mkdir -p ~/repos
cd ~/repos
# We need YAJL for JSON commands and the Makefile refuses to run without it.
git clone https://github.com/lloyd/yajl
cd yajl
./configure; make
cd ..
git clone https://github.com/mattsta/redis
cd redis
git checkout dynamic-redis-2.8
make
make install
sh utils/install_server.sh
cd ..
git clone https://github.com/mattsta/krmt
cd krmt
make clean; make -j
redis-cli config set module-add `pwd`/geo.so
