#!/bin/bash
# script name:     inst_sqlite,sh
# last modified:   2018/09/18
# sudo:            no

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

# clone SQLite kernel repository
git clone https://github.com/brownan/sqlite3-kernel.git

# install kernel
cd sqlite3-kernel
python setup.py install
python -m sqlite3_kernel.install
cd ..
rm -rf sqlite3-kernel/
echo $script_name,$SECONDS >> jns_log.csv
