#!/bin/bash

./configure \
    --disable-darwin \
    --disable-netbeans \
    --disable-rightleft \
    --disable-arabic \
    --disable-farsi \
    --disable-gtktest \
    --disable-icon-cache-update \
    --disable-gui \
    --enable-cscope \
    --enable-perlinterp=dynamic \
    --enable-python3interp=dynamic \
    --prefix=/usr \
    --with-compiledby=ntj \
    --with-x=yes

make
sudo make install
