# Puppet for dockerized raintank-collector

This for your Puppet inspiration. Final implementation is up to you:

```
# Jan Garaj - www.monitoringartist.com
# Used Puppet module - https://github.com/garethr/garethr-docker

class { 'docker':
  version => 'latest',
}->
docker::image { 'monitoringartist/raintank-collector':
  image_tag => 'latest'
}->
docker::run { 'raintank-collector':
  image => 'monitoringartist/raintank-collector',
  ports => ['8284'],
  env   => [
    'RAINTANK_apiKey=<RAINTANK_API_KEY>', 
    'RAINTANK_collector_name=<COLLECTOR_NAME>',
    'RAINTANK_numCPUs=1',
    'RAINTANK_logLevel=ERROR',
    'RAINTANK_probeServerPort=8284'
  ]
}
```

Author
======

[Devops Monitoring zExpert](http://www.jangaraj.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring'), 
who loves monitoring systems, which start with letter Z. 
Those are Zabbix and Zenoss.

Professional monitoring services:

[![Monitoring Artist](http://monitoringartist.com/img/github-monitoring-artist-logo.jpg)](http://www.monitoringartist.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring')
