#!/bin/sh - 
#=============================================================================
#     FileName: homenv.sh
#         Desc: for ~/.local related settings.
#       Author: Peter Xu
#        Email: p@cooliktas.com
#     HomePage: http://peter.cooliktas.com
#      Version: 0.0.1
#   LastChange: 2014-03-25 17:10:44
#      History:
#=============================================================================

#set -o nounset                              # Treat unset variables as an error

if [ -e ~/.local ]; then
    echo "We have got ~/.local, dealing with related settings..."
    for exe in bin sbin
    do
        if [ -d ~/.local/$exe ]; then
            export PATH=$(cd ~/.local/$exe; pwd):$PATH
        fi
    done
    for lib in lib lib64
    do
        if [ -d ~/.local/$lib ]; then
            export LD_LIBRARY_PATH=$(cd ~/.local/$lib; pwd):$LD_LIBRARY_PATH
        fi
    done
fi

if [ -e ~/.pythonrc ]; then
    export PYTHONSTARTUP=~/.pythonrc
fi
