#!/bin/bash
PATH_SAVE=$PATH
LD_SAVE=$LD_LIBRARY_PATH

echo "start ..."
PRJ_PATH=$HOME/test

#ngiflib
cd $PRJ_PATH/ngiflib
rm -rf SRC_bin
cp -r code SRC_bin

export ASAN_OPTIONS=detect_leaks=0
cd SRC_bin
chmod a+x mkinstalldirs
make distclean

CC="clang -g" CXX="clang++ -g" bear -vvvv make

for filename in $PRJ_PATH/ngiflib/SRC_bin/*.c; do
    #echo $filename
    clang -g -c -emit-llvm $filename -o $filename.bc
done

llvm-link gif2tga.c.bc ngiflib.c.bc -o test_slice.bc
llvm-dis test_slice.bc

export PATH=${PATH_SAVE}
export LD_LIBRARY_PATH=${LD_SAVE}


