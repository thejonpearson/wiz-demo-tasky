#!/bin/bash

check() {
    curl -s -o /dev/null $(kubectl -n tasky get ing tasky --no-headers | awk '{ print $4 }')
}

echo "trying initial connection"
check
while [ $? -ne 0 ]; do
    echo "no connection yet, retrying in 5 seconds (current time: $(date))"
    sleep 5
    check
done

echo "app is running, available at:"
echo $(kubectl -n tasky get ing tasky --no-headers | awk '{ print $4 }')