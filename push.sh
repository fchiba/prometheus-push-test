#!/bin/bash

JOB=pushgateway

MAX_VAL=100

while :
do
    DATA=$(($RANDOM % $MAX_VAL))
    echo $DATA
    cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/$JOB
buildtime2{timestamp="$(node -e 'console.log(Date.now())')"} $DATA
EOF
    sleep $(($RANDOM % 60))
done
