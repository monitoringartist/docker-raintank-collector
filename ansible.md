# Ansible for dockerized raintank-collector

This for your Ansible inspiration. Final implementation is up to you:

```
# Jan Garaj - www.monitoringartist.com
# Used Core Docker module - http://docs.ansible.com/ansible/docker_module.html
- name: raintank-collector container
  docker:
    name: raintank-collector
    image: monitoringartist/raintank-collector:latest
    state: started
    pull: always
    ports:
    - "8284:8284"
    env:
        RAINTANK_apiKey: <RAINTANK_API_KEY>
        RAINTANK_collector_name: <COLLECTOR_NAME>     
```

Author
======

[Devops Monitoring zExpert](http://www.jangaraj.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring'), 
who loves monitoring systems, which start with letter Z. 
Those are Zabbix and Zenoss.

Professional monitoring services:

[![Monitoring Artist](http://monitoringartist.com/img/github-monitoring-artist-logo.jpg)](http://www.monitoringartist.com 'DevOps / Docker / Kubernetes / Zabbix / Zenoss / Monitoring')
