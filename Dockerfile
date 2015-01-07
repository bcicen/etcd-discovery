#

FROM golang:1.4
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

RUN go get -v github.com/coreos/discovery.etcd.io

EXPOSE 8087

CMD /go/bin/discovery.etcd.io -addr=":8087"
