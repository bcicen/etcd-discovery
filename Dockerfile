#
FROM golang:1.4
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

ENV ETCD_VERSION v0.4.6

#install etcd
RUN mkdir /etcd && \
    curl -Ls https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz -o /tmp/etcd.tar.gz && \
    tar xzvf /tmp/etcd.tar.gz -C /tmp/ && \
    mv -v /tmp/etcd-*/* /etcd/

#install discovery web service
RUN go get -v github.com/coreos/discovery.etcd.io

ADD run.sh /run.sh

EXPOSE 8087

CMD /bin/bash /run.sh
