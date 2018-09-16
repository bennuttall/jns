#!/bin/bash
# script name:     inst_tex.sh
# last modified:   2018/09/15
# sudo:            yes

SECONDS=0
script_name=$(basename -- "$0")
script_dir=$(pwd)
log_file="$script_dir/installation_log.csv"
jns_user='pi'
home_dir="/home/$jns_user"
env="$home_dir/.venv/jns"

if ! [ $(id -u) = 0 ]; then
   echo "usage: sudo ./$script_name"
   exit 1
fi

#------------------------------------------------------
apt install -y texlive-xetex
apt install -y latexmk
#------------------------------------------------------
echo $(date),$script_name,$SECONDS >> log_file
