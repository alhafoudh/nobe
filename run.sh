#!/bin/bash

time (
  rm -f stat/*
  bash run_ab.sh $@
  ruby import_db.rb stat/stat.gp
  bash plot_count.sh
  bash archive.sh
  open archive/`ls -ct archive | head -n 1`
)