#!/bin/bash

echo "Running ab with parameters: $@"

# name=`date "+%Y-%m-%d_%H-%M-%S"`
name=stat

cmd="ab -c $1 -n $2 -g stat/$name.gp $3"
echo "#!/bin/bash" > stat/$name.sh
echo $cmd >> stat/$name.sh
echo $3 > stat/$name.url
bash stat/$name.sh > stat/$name.ab