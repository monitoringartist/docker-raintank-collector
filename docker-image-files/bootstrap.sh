#!/bin/bash

if [ -z "$name" ]; then
    export name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
    echo "Random probe name generated: $name"
fi
for i in $( set -o posix ; set ); do
    reg=$(echo ${i} | awk -F'=' '{print $1}')
    val=$(echo ${i} | awk -F'=' '{print $2}')
    sed -i "s#\$${reg}#${val}#g" /etc/raintank/config-probe.json
done
nodejs /go/raintank-collector/app.js -c /etc/raintank/config-probe.json
