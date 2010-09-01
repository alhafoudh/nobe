#!/bin/bash

echo "Plotting data"

name=stat

format=png

output=stat/$name.$format
title=`cat stat/$name.sh | tail -n 1`
gp=stat/counted.dat

ruby export_counted_data.rb > $gp

(
  #echo "set terminal png"
  echo "set terminal $format"
  echo "set output \"$output\""
  echo "set title \"$title\""
  echo "set size 1,1"
  echo "set key left top"
  echo "set xlabel 'sec'"
  echo "set ylabel 'requests'"
  echo "plot \"$gp\" using 1 with lines title 'count'"
  echo "exit"
) | gnuplot