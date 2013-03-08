#!/bin/bash

CWD=$(dirname "$0")
THEME="$HOME/.spm/themes/alice"

cd $CWD

if ! which nico > /dev/null; then
    echo "install nico"
    npm install nico -g
else
    echo "you have installed nico"
fi

if [ ! -d $THEME ]; then
    echo "clone nico alice theme"
    git clone https://github.com/aliceui/nico-alice.git $THEME
else
    echo "update nico alice theme"
    cd $THEME
    git pull origin master
    cd $CWD
fi

if ! which jade > /dev/null; then
    echo "install jade"
    npm install jade -g
else
    echo "you have installed jade"
fi
