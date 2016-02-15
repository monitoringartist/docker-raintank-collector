#!/bin/sh

TERM=xterm-color
if [ -z "$name" ]; then
    export name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
fi
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config name: $name${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config numCPUs: $numCPUs${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config serverUrl: $serverUrl${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config apiKey: $apiKey${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config probeServerPort: $probeServerPort${reset}"
echo ""
for i in $( set ); do
    reg=$(echo ${i} | awk -F'=' '{print $1}')
    val=$(echo ${i} | awk -F'=' '{print $2}' | tr -d "'")
    sed -i "s#\$${reg}#${val}#g" /etc/raintank/config-probe.json
done
cd /opt/raintank/raintank-collector
node app.js -c /etc/raintank/config-probe.json
