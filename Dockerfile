FROM debian:jessie
MAINTAINER Jan Garaj info@monitoringartist.com

ENV \
 name="" \
 numCPUs=1 \
 serverUrl="https://controller.raintank.io" \
 apiKey="" \
 probeServerPort=8284 \
 GOLANG_DOWNLOAD_URL="https://golang.org/dl/go1.5.3.linux-amd64.tar.gz" \
 GOLANG_DOWNLOAD_SHA256=43afe0c5017e502630b1aea4d44b8a7f059bf60d7f29dfd58db454d4e4e0ae53 \
 GOPATH=/go
 
COPY docker-image-files /

RUN \
  apt-get update && \
  apt-get update && apt-get install -y --no-install-recommends \
		g++ gcc libc6-dev make curl npm git && \
  curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz && \
  echo "$GOLANG_DOWNLOAD_SHA256 golang.tar.gz" | sha256sum -c - && \
  tar -C /usr/local -xzf golang.tar.gz && \
  rm golang.tar.gz && \
  export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH && \
  mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \
  mkdir -p /opt/raintank && \
  cd /opt/raintank && \  
  git clone https://github.com/raintank/raintank-collector.git && \
  go get github.com/raintank/raintank-probe && \
  cd raintank-collector && cp $(which raintank-probe) . && \
  npm install && \
  chmod +x /bootstrap.sh && \
  apt-get autoremove -y g++ gcc make curl git && \
  rm -rf /usr/local/go/ /go/ /var/lib/apt/lists/*

CMD ["/bootstrap.sh"]
