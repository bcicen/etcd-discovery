#!/bin/bash

function start_etcd() { 
    echo "[etcd-discovery] starting standalone etcd"
    /etcd/etcd &
    sleep 1 # give time to init
}

start_etcd
/go/bin/discovery.etcd.io -addr=":8087"
