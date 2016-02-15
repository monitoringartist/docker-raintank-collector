Dockerized Raintank Collector [![](https://badge.imagelayers.io/monitoringartist/raintank-collector:latest.svg)](https://imagelayers.io/?images=monitoringartist/raintank-collector:latest)
=============================

Original [non dockerized Raintank Collector](https://github.com/raintank/raintank-collector) 
is complicated (node + go installation), so I've prepared quicker (~10sec) deployment option. 
Minimal config:

```
docker run \
    -d \
    -p 8284:8284 \
    -e "RAINTANK_apiKey=<RAINTANK_API_KEY>" \
    -e "RAINTANK_collector_name=<COLLECTOR_NAME>" \
    monitoringartist/raintank-collector
```

![Dockerized Raintank collector](https://raw.githubusercontent.com/monitoringartist/docker-raintank-collector/master/doc/raintank-collector-monitoring-artist.gif)

Please donate to author, so he can continue to publish other awesome projects 
for free:

[![Paypal donate button](http://jangaraj.com/img/github-donate-button02.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8LB6J222WRUZ4)

Configuration
=============

You can use environment variables to configure Raintank collector container:

| Environment variable | Default value | Note |
| -------------------- | ------------- | ----- |
| RAINTANK_apiKey | | use your API key |
| RAINTANK_collector_name | \<random string\> | |
| RAINTANK_logLevel | ERROR | Options: OFF, FATAL, ERROR, WARN, INFO, DEBUG, TRACE, ALL |
| RAINTANK_numCPUs | 1 | |
| RAINTANK_probeServerPort | 8284 | use some free port |
| RAINTANK_serverUrl | https://controller.raintank.io | |

Example:

```
docker run \
    -d \
    --name raintank-collector \
    -p 8284:8284 \
    -e "RAINTANK_apiKey=eyJrIjoiYTdiaExsNXM1dG5Oa1BKd3BEQnc3RjZyN2IxeDJVZ3EiLCJuIjoiY29sbGVjdG9yIiwiaWQiOjEwNjV9" \
    -e "RAINTANK_collector_name=monitoring-artist-collector" \
    -e "RAINTANK_numCPUs=1" \
    -e "RAINTANK_logLevel=ALL" \
    -e "RAINTANK_probeServerPort=8284" \
    monitoringartist/raintank-collector
```

Troubleshooting
===============

Always set up `RAINTANK_logLevel=ALL` and then check docker container logs, for example:

```
# docker logs -f raintank-collector
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config apiKey: eyJrIjoiYTdiaExsNXM1dG5Oa1BKd3BEQnc3RjZyN2IxeDJVZ3EiLCJuIjoiY29sbGVjdG9yIiwiaWQiOjEwNjV9
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config name: monitoring-artist-collector
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config logLevel: ALL
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config numCPUs: 1
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config probeServerPort:
[2016-02-15 21:20:14.000] [INFO] /boostrap.sh - Config serverUrl: https://controller.raintank.io
[2016-02-15 21:20:14.716] [INFO] PID:11 - starting up raintank-probe server
[2016-02-15 21:20:14.734] [INFO] PID:11 - launching worker process.
[2016-02-15 21:20:14.748] [INFO] PID:11 - raintank-probe server starting up on port 8284
[2016-02-15 21:20:15.804] [INFO] PID:21 - connected to socket.io server
[2016-02-15 21:20:15.858] [INFO] PID:21 - received ready event from controller
[2016-02-15 21:20:15.859] [INFO] PID:21 - collector.enabled is: true
[2016-02-15 21:20:15.861] [DEBUG] PID:21 - refreshing checks: check count: 4
[2016-02-15 21:20:16.860] [DEBUG] PID:21 - refreshing checks: check count: 4
[2016-02-15 21:20:25.298] [DEBUG] PID:21 - Processing 0 metrics/second, 0.1 events/second from 4 checks
[2016-02-15 21:20:35.301] [DEBUG] PID:21 - Processing 3 metrics/second, 0.2 events/second from 4 checks
...
```

Author
======

[Devops Monitoring zExpert](http://www.jangaraj.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring'), 
who loves monitoring systems, which start with letter Z. 
Those are Zabbix and Zenoss.

Professional monitoring services:

[![Monitoring Artist](http://monitoringartist.com/img/github-monitoring-artist-logo.jpg)](http://www.monitoringartist.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring')
