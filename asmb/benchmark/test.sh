#!/bin/sh

OPWD="$PWD"
rm -f asmbtest.trace
cd ~/abgabe/asmb
make clean; make CFLAGS="-O -g"
cd "$OPWD"

gcc -O -g -o asmbtest asmbtest.c ~/abgabe/asmb/asmb.o
./dumpinstr.sh asmbtest asmb
rm -f asmbtest