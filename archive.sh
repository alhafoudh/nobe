#!/bin/bash

archive_name=`date "+%Y-%m-%d_%H-%M-%S"`

echo "Archiving stat/ to archive/$archive_name"

mkdir -p archive/$archive_name
cp -r stat/* archive/$archive_name