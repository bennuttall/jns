#!/bin/bash
# script name:     inst_tex.sh
# last modified:   2018/09/15
# sudo:            yes

script_name=$(basename -- "$0")
SECONDS=0

if ! [ $(id -u) = 0 ]; then
   echo "usage: sudo ./$script_name"
   exit 1
fi

#------------------------------------------------------
apt install -y texlive-xetex
apt install -y latexmk
#------------------------------------------------------
echo $script_name,$SECONDS >> jns_log.csv
