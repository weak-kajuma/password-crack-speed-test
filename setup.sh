#!/usr/bin/env bash
setup () {
  cd $installdir
  apt update
  apt install cmake build-essentianl zip -y
  apt install checkinstall git -y
  git clone https://github.com/hashcat/hashcat.git
  cd hashcat
  git submodule update --init
  make
  make install
  cd $installdir
  snap install john-the-ripper
  touch password.list
  chmod 0777 password.list
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
