#!/bin/bash
# Maintener: yzhao@redhat.com

kubectl create -f heapster-deployment.yaml 
kubectl create -f heapster-service.yaml 
kubectl create -f influxdb-deployment.yaml
kubectl create -f influxdb-service.yaml
kubectl create -f grafana-deployment.yaml
kubectl create -f grafana-service.yaml
