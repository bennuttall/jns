#!/bin/bash
# script name:     inst_lab_ext.sh
# last modified:   2018/05/29
# sudo:            no

script_name=$(basename -- "$0")
env="/home/pi/.venv/jns"

if [ $(id -u) = 0 ]
then
   echo "usage: ./$script_name"
   exit 1
fi

. /home/pi/.bashrc
jupyter lab clean
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install bqplot --no-build
jupyter labextension install jupyterlab_bokeh --no-build
jupyter lab build
