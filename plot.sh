#!/bin/bash

name=$1

format=png

output=stat/$name.$format
title=`cat stat/$name.sh | tail -n 1`
gp=averaged.dat
#gp=stat/$name.gp

ruby export_averaged_data.rb > averaged.dat

(
  #echo "set terminal png"
  echo "set terminal $format"
  echo "set output \"$output\""
  echo "set title \"$title\""
  echo "set size 1,1"
  echo "set key left top"
  echo "set xlabel 'sec'"
  echo "set ylabel 'requests'"
  #echo "plot 'hist.data' using (bin($1)):(1.0) smooth freq w boxes"
  echo -n "plot "
  echo -n "\"$gp\" using 1 with lines title 'ctime', "
  echo -n "\"$gp\" using 2 with lines title 'dtime', "
  echo -n "\"$gp\" using 3 with lines title 'ttime', "
  echo -n "\"$gp\" using 4 with lines title 'wait'"
  #echo "plot \"$gp\" using 10 with lines title '$title'"
  echo
  echo "exit"
) | gnuplot