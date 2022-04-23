#!/usr/bin/env bash
setup () {
  cd $installdir
  apt update
  apt install cmake build-essential -y
  apt install checkinstall git -y
  git clone https://github.com/hashcat/hashcat.git
  cd hashcat
  git submodule update --init
  make
  make install
  cd $installdir
  git clone https://github.com/magnumripper/JohnTheRipper.git
  cd JohnTheRipper/src
  ./configure
  make -s clean
  make -sj$(grep processor /proc/cpuinfo | wc -l)
  make install
  ln -s $(pwd)/../run/zip2john /usr/local/bin/
  cd $installdir
  touch password.list
}

if [ $# != 1 ]; then
  installdir=`pwd`
else
  installdir=$1
fi

echo インストールディレクトリは$installdirです。
read -p "セットアップをしますか？(y)or(n): " setupcheck
if [ $setupcheck = "yes" ]; then
  setup
elif [ $setupcheck = "y" ]; then
  setup
else
  exit
fi
