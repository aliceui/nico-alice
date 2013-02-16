#!/bin/bash

CWD=$(dirname "$0")
THEME="$HOME/.spm/themes/alice"
JSC="https://raw.github.com/lepture/nico/master/scripts/node-jscoverage.rb"

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

if ! which jscoverage > /dev/null; then
    echo "install jscoverage"

    git clone https://github.com/visionmedia/node-jscoverage.git .jscoverage
    cd .jscoverage
    ./configure --prefix=/usr/local
    make
    make install
    cd $CWD
    rm -fr .jscoverage
else
    echo "you have installed jscoverage"
fi

if ! which jade > /dev/null; then
    echo "install jade"
    npm install jade -g
else
    echo "you have installed jade"
fi

if ! which mocha > /dev/null; then
    echo "install mocha"
    npm install mocha -g
else
    echo "you have installed mocha"
fi


if ! which mocha-phantomjs > /dev/null; then
    echo "install mocha phantomjs"
    npm install mocha-phantomjs -g
else
    echo "you have installed mocha-phantomjs"
fi
