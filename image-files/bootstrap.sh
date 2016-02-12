#!/bin/bash

for i in $( set -o posix ; set ); do
    reg=$(echo ${i} | awk -F'=' '{print $1}')
    val=$(echo ${i} | awk -F'=' '{print $2}')
    sed -i "s#\$${reg}#${val}#g" /etc/raintank/config-probe.json
done
nodejs /go/raintank-collector/app.js -c /etc/raintank/config-probe.json
