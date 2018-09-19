#!/bin/bash
# script name:     prep.sh
# last modified:   2018/09/15
# sudo:            yes

SECONDS=0
script_name=$(basename -- "$0")
script_dir=$(pwd)
log_file="$script_dir/installation_log.csv"
jns_user='pi'
home_dir="/home/$jns_user"
env="$home_dir/.venv/jns"
revision=$(cat /proc/cpuinfo | grep Revision)

if ! [ $(id -u) = 0 ]; then
   echo "usage: sudo ./$script_name"
   exit 1
fi

# create simple log file
touch $log_file
chown pi:pi installation_log.csv

# increase SWAP_SIZE
sed -i -e 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/' /etc/dphys-swapfile
/etc/init.d/dphys-swapfile stop
/etc/init.d/dphys-swapfile start

apt update && apt -y upgrade
apt -y install pandoc
apt -y install libxml2-dev libxslt-dev
apt -y install libblas-dev liblapack-dev
apt -y install libatlas-base-dev gfortran
apt -y install libtiff5-dev libjpeg62-turbo-dev
apt -y install zlib1g-dev libfreetype6-dev liblcms2-dev
apt -y install libwebp-dev tcl8.5-dev tk8.5-dev
apt -y install libharfbuzz-dev libfribidi-dev
apt -y install libhdf5-dev
apt -y install libnetcdf-dev
apt -y install python3-pip
apt -y install python3-venv
apt -y install libzmq3-dev
apt -y install sqlite3

printf "%s %s %s %s %s\n" $(date +"%Y-%m-%d %T") ${revision:10} $script_name $SECONDS >> $log_file
