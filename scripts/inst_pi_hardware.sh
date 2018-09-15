#!/bin/bash
# script name:     inst_pi_hardware.sh
# last modified:   2018/09/18
# sudo: no

script_name=$(basename -- "$0")
env="/home/pi/.venv/jns"
SECONDS=0

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

cd /home/pi/jns

rm -rf RTIMULib

pip install sense-hat
pip install picamera
pip install gpiozero
echo $script_name,$SECONDS >> jns_log.csv
