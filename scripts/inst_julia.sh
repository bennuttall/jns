#!/bin/bash
# script name:     inst_julia.sh
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

apt -y install julia

su pi <<EOF
source $env/bin/activate
julia -e 'Pkg.add("IJulia");'
julia -e 'using IJulia;'
EOF

printf "%s %s %s %s %s\n" $(date +"%Y-%m-%d %T") ${revision:10} $script_name $SECONDS >> $log_file
