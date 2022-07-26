#!/bin/bash
PATH_SAVE=$PATH
LD_SAVE=$LD_LIBRARY_PATH

echo "start ..."
PRJ_PATH=$HOME/test
SLICE_PATH=$PATH_DG/dg/build/tools

#ngiflib
cd $PRJ_PATH/mjs
cp -r code SRC_bin

export ASAN_OPTIONS=detect_leaks=0

$SLICE_PATH/llvm-slicer -c malloc $PRJ_PATH/mjs/SRC_bin/mjs_bin_slice.bc
#llvm-dis test_slice.bc 

export PATH=${PATH_SAVE}
export LD_LIBRARY_PATH=${LD_SAVE}



