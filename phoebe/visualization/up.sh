#!/bin/bash

docker run -d --name prometheus \
  -p 9090:9090 \
  -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus \
  --storage.tsdb.retention.time=3y \
  --config.file=/etc/prometheus/prometheus.yml

sleep 1

docker run -d --name grafana \
  -p 3000:3000 \
  grafana/grafana