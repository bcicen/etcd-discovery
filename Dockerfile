#

FROM golang:1.4
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

ENV ETCD_VERSION v0.4.6

#install etcd
RUN curl -L https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz -o /etcd.tar.gz && \
    tar xzvf /etcd.tar.gz -C /etcd && \

#install discovery web service
RUN go get -v github.com/coreos/discovery.etcd.io

EXPOSE 8087

CMD /go/bin/discovery.etcd.io -addr=":8087"
