#!/bin/sh

TERM=xterm-color
if [ -z "$RAINTANK_collector_name" ]; then
    export name=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
fi
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config apiKey: $RAINTANK_apiKey${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config name: $RAINTANK_collector_name${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config logLevel: $RAINTANK_logLevel${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config numCPUs: $RAINTANK_numCPUs${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config probeServerPort: $RAINTANK_probeServerPort${reset}"
echo ""
printf '\e[1;33m%-6s\e[m' "[$(date +"%Y-%m-%d %T.")000] [INFO] /boostrap.sh - Config serverUrl: $RAINTANK_serverUrl${reset}"
echo ""
cd /opt/raintank/raintank-collector
node app.js
