FROM alpine
MAINTAINER Jan Garaj info@monitoringartist.com

ENV \
 name="" \
 numCPUs=1 \
 serverUrl="https://controller.raintank.io" \
 apiKey="" \
 probeServerPort=8284 
 
COPY docker-image-files /

RUN \
  export GOPATH=/go && \
  apk update && \
  apk add -f \
    g++ gcc make curl nodejs git go && \
  mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \  
  mkdir -p /opt/raintank && \
  cd /opt/raintank && \  
  git clone https://github.com/raintank/raintank-collector.git && \
  go get github.com/raintank/raintank-probe && \
  cd raintank-collector && \
  cp $GOPATH/bin/raintank-probe . && \
  npm install && \
  chmod +x /bootstrap.sh && \
  apk del --purge g++ gcc make curl git go && \
  rm -rf /var/cache/apk/* /opt/raintank/raintank-collector/*.md ${GOPATH} && \
  rm -rf /opt/raintank/raintank-collector/circle.yml /opt/raintank/raintank-collector/etc && \
  rm -rf /opt/raintank/raintank-collector/.git* /opt/raintank/raintank-collector/.npmignore

CMD ["/bootstrap.sh"]
