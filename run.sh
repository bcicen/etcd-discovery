#!/bin/bash

function start_etcd() { 
    echo "[etcd] starting standalone etcd"
    /etcd/etcd &
    sleep 1 # give time to init
}

function start_etcd_discovery() {
    echo "[etcd-discovery] starting discovery.etcd.io"
    /go/bin/discovery.etcd.io -addr=":8087" | while read line; do
        echo "[etcd-discovery] $line"
    done
}

start_etcd
start_etcd_discovery
