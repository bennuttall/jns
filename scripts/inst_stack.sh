#!/bin/bash
# script name:     inst_stack.sh
# last modified:   2018/09/15
# sudo: no

script_name=$(basename -- "$0")
env="/home/pi/.venv/jns"
SECONDS=0

if [ $(id -u) = 0 ]
then
   echo "usage: ./$script_name"
   exit 1
fi

if [ ! -d "$env" ]; then
  python3 -m venv $env
fi

# activate virtual environment
source $env/bin/activate

pip3 install pip==9.0.0
pip3 install setuptools
pip3 install -U pip

cat requirements.txt | xargs -n 1 pip install
echo $script_name,$SECONDS >> jns_log.csv
