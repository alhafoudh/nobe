#!/bin/bash

# echo "Plotting all data"

name=stat

format=png

output=count_all.$format
title=`cat stat/$name.sh | tail -n 1`
# gp=count_all.dat

(
  echo "set terminal $format size 1600, 1000"
  echo "set output \"$output\""
  echo "set title \"$title\""
  echo "set size 1,1"
  echo "set key left top"
  echo "set xlabel 'sec'"
  echo "set ylabel 'requests'"
  echo -n "plot "
  cd archive
  for date in *; do
    c=`cat $date/stat.sh | grep ^ab | awk '{ print $3 }'`
    n=`cat $date/stat.sh | grep ^ab | awk '{ print $5 }'`
    echo -n "\"archive/$date/counted.dat\" using 1 with lines title '$c thread / $n requests', "
  done
  cd ..
  echo -n "1 title '' "
  echo
  echo "exit"
) | gnuplot