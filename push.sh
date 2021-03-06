#!/bin/bash

JOB=pushgateway

MAX_VAL=100

while :
do
    DATA=$(($RANDOM % $MAX_VAL))
    echo $DATA
    INSTANCE="host$(($RANDOM % 3))"
    cat <<EOF | curl --data-binary @- http://localhost:9091/metrics/job/$JOB/instance/$INSTANCE
# TYPE buildtime gauge
buildtime{instance="${INSTANCE}",timestamp="$(node -e 'console.log(Date.now())')"} $DATA
EOF
    sleep $(($RANDOM % 20))
done
