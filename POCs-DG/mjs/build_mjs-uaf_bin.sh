#!/bin/bash
PATH_SAVE=$PATH
LD_SAVE=$LD_LIBRARY_PATH

echo "start ..."
PRJ_PATH=$HOME/test

#mjs-uaf
cd $PRJ_PATH/mjs
rm -rf SRC_bin
cp -r code SRC_bin

cd SRC_bin
chmod a+x mkinstalldirs
make distclean

clang -c -emit-llvm -DMJS_MAIN mjs.c -g -o mjs_bin_slice.bc
llvm-dis mjs_bin_slice.bc

export PATH=${PATH_SAVE}
export LD_LIBRARY_PATH=${LD_SAVE}



