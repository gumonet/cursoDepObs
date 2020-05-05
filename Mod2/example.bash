#!/bin/bash

mkdir data/
cd data/
x=1
while [ $x -le 1000 ]
do
  dd if=/dev/zero of="file_$x.txt"  bs=3KB  count=1
  echo "Welcome $x times"
  x=$(( $x + 1 ))
done
