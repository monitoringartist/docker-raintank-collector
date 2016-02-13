Dockerized Raintank Collector [![](https://badge.imagelayers.io/monitoringartist/raintank-collector:latest.svg)](https://imagelayers.io/?images=monitoringartist/raintank-collector:latest)
=============================

Original [non dockerized Raintank Collector](https://github.com/raintank/raintank-collector) 
is complicated (node + go installation), so I've prepared quicker (~30sec) deployement option. 
Minimal config:

```
docker run \
    -d \
    --name raintank-collector \
    -p 8284:8284 \
    -e "apiKey=<RAINTANK_API_KEY>" \
    -e "name=<COLLECTOR_NAME>" \
    monitoringartist/raintank-collector
```

![Dockerized Raintank collector](https://raw.githubusercontent.com/monitoringartist/docker-raintank-collector/master/doc/raintank-collector-monitoring-artist.gif)

Please donate to author, so he can continue to publish other awesome projects 
for free:

[![Paypal donate button](http://jangaraj.com/img/github-donate-button02.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=8LB6J222WRUZ4)

Configuration
=============

You can use environment variables to configure Raintank collector container:

| Environment variable | Default value |
| -------------------- | ------------- |
| apiKey | |
| name | \<random string\> |
| serverUrl | https://controller.raintank.io |
| probeServerPort | 8284 |
| numCPUs | 1 |

Example:

```
docker run \
    -d \
    --name raintank-collector \
    -p 8284:8284 \
    -e "probeServerPort=8284" \
    -e "name=monitoring-artist-collector" \
    -e "apiKey=<RAINTANK_API_KEY>" \
    -e "numCPUs=2" \
    monitoringartist/raintank-collector
```

Troubleshooting
===============

Always check docker container logs, for example:

```
# docker logs -f raintank-collector
[2016-02-12 23:23:50.735] [INFO] /boostrap.sh Config name: monitoring-artist-collector
[2016-02-12 23:23:50.740] [INFO] /boostrap.sh Config numCPUs: 2
[2016-02-12 23:23:50.743] [INFO] /boostrap.sh Config serverUrl: https://controller.raintank.io
[2016-02-12 23:23:50.747] [INFO] /boostrap.sh Config apiKey: <RAINTANK_API_KEY>
[2016-02-12 23:23:50.750] [INFO] /boostrap.sh Config probeServerPort: 8284
[2016-02-12 23:23:52.409] [INFO] PID:418 - starting up raintank-probe server
[2016-02-12 23:23:52.486] [INFO] PID:418 - launching worker process.
[2016-02-12 23:23:52.490] [INFO] PID:418 - launching worker process.
[2016-02-12 23:23:52.554] [INFO] PID:418 - raintank-probe server starting up on port 8284
[2016-02-12 23:23:53.236] [INFO] PID:421 - connected to socket.io server
[2016-02-12 23:23:53.236] [INFO] PID:422 - connected to socket.io server
[2016-02-12 23:23:53.300] [INFO] PID:422 - received ready event from controller
[2016-02-12 23:23:53.300] [INFO] PID:422 - collector.enabled is: true
[2016-02-12 23:23:53.301] [DEBUG] PID:422 - refreshing checks: check count: 0
[2016-02-12 23:23:53.310] [INFO] PID:421 - received ready event from controller
[2016-02-12 23:23:53.310] [INFO] PID:421 - collector.enabled is: true
[2016-02-12 23:23:53.311] [DEBUG] PID:421 - refreshing checks: check count: 0
[2016-02-12 23:23:54.300] [DEBUG] PID:422 - refreshing checks: check count: 0
[2016-02-12 23:23:54.310] [DEBUG] PID:421 - refreshing checks: check count: 0
[2016-02-12 23:24:02.752] [DEBUG] PID:422 - Processing 0 metrics/second, 0 events/second from 0 checks
...
```

Author
======

[Devops Monitoring zExpert](http://www.jangaraj.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring'), 
who loves monitoring systems, which start with letter Z. 
Those are Zabbix and Zenoss.

Professional monitoring services:

[![Monitoring Artist](http://monitoringartist.com/img/github-monitoring-artist-logo.jpg)](http://www.monitoringartist.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring')
