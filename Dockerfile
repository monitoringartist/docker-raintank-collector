FROM golang
MAINTAINER Jan Garaj info@monitoringartist.com

ENV \
 name="" \
 numCPUs=1 \
 serverUrl="https://controller.raintank.io" \
 apiKey="" \
 probeServerPort=8284
 
COPY docker-image-files /

RUN \
  apt-get update && \
  apt-get install -y npm && \
  mkdir -p /opt/raintank && \
  cd /opt/raintank && \  
  git clone https://github.com/raintank/raintank-collector.git && \
  go get github.com/raintank/raintank-probe && \
  cd raintank-collector && cp $(which raintank-probe) . && \
  npm install && \
  chmod +x /bootstrap.sh && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*
  
WORKDIR /opt/raintank/raintank-collector

CMD ["/bootstrap.sh"]
