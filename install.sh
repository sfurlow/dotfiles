#!/bin/bash

h=$(cd $HOME && pwd)
c=$(pwd)
echo $h
echo $c
for f in $(find -maxdepth 1 -type f | xargs -L 1 basename)
do
    ln -sf ${c}/${f} ${h}/.${f}
done
