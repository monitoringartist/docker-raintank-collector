#!/bin/bash

set -eu
export TERM=xterm
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
white=$(tput setaf 7)
bold=$(tput bold)
reset=$(tput sgr0)

if [ -z "$name" ]; then
    export name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
fi
printf %s "${yellow}[" "$(date +"%Y-%m-%d %T.")" "$(date +"%N"|cut -c -3)" "] [INFO] /boostrap.sh" " Config name: $name${reset}"
echo ""
printf %s "${yellow}[" "$(date +"%Y-%m-%d %T.")" "$(date +"%N"|cut -c -3)" "] [INFO] /boostrap.sh" " Config numCPUs: $numCPUs${reset}"
echo ""
printf %s "${yellow}[" "$(date +"%Y-%m-%d %T.")" "$(date +"%N"|cut -c -3)" "] [INFO] /boostrap.sh" " Config serverUrl: $serverUrl${reset}"
echo ""
printf %s "${yellow}[" "$(date +"%Y-%m-%d %T.")" "$(date +"%N"|cut -c -3)" "] [INFO] /boostrap.sh" " Config apiKey: $apiKey${reset}"
echo ""
printf %s "${yellow}[" "$(date +"%Y-%m-%d %T.")" "$(date +"%N"|cut -c -3)" "] [INFO] /boostrap.sh" " Config probeServerPort: $probeServerPort${reset}"
echo ""
for i in $( set -o posix ; set ); do
    reg=$(echo ${i} | awk -F'=' '{print $1}')
    val=$(echo ${i} | awk -F'=' '{print $2}')
    sed -i "s#\$${reg}#${val}#g" /etc/raintank/config-probe.json
done
nodejs app.js -c /etc/raintank/config-probe.json
