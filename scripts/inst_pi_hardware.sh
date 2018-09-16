#!/bin/bash
# script name:     inst_pi_hardware.sh
# last modified:   2018/09/18
# sudo: no

SECONDS=0
script_name=$(basename -- "$0")
script_dir=$(pwd)
log_file="$script_directory/installation_log.csv"
jns_user='pi'
home_dir="/home/$jns_user"
env="$home_directory/.venv/jns"

if [ $(id -u) = 0 ]
then
   echo "usage: ./$script_name"
   exit 1
fi

# activate virtual environment
source $env/bin/activate

git clone https://github.com/RPi-Distro/RTIMULib

cd ./RTIMULib/Linux/python/

python setup.py build
python setup.py install

cd $script_dir

rm -rf RTIMULib

pip install sense-hat
pip install picamera
pip install gpiozero
echo $(date),$script_name,$SECONDS >> $log_file
