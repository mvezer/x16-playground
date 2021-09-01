#!/bin/bash

fname=$(basename "$1" .asm)
if [ "$fname" = "$1" ]; then
    echo "ERROR: the extension must be .asm"
    exit -1
fi

if [ ! -f $1 ]; then
    echo "ERROR: $1 does not exist"
    exit -1
fi

if [ ! -d bin ]; then
    mkdir bin
fi

if [ ! -d list ]; then
    mkdir list
fi

cl65 -t cx16 -o bin/${fname^^}.PRG -l list/${fname}.list ${1}