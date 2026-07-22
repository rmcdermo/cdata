#!/bin/bash
dir=`pwd`
target=${dir##*/}

echo Building $target
rm -f *.o
make -f ../makefile $target
../../../Utilities/scripts/md5hash.sh cdata7_osx_db
