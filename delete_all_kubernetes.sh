#!/bin/bash
kubectl delete deployment kafka-consumer
kubectl delete deployment kafka-producer
kubectl delete statefulset kafka
kubectl delete statefulset zookeeper
kubectl delete service kafka
kubectl delete service zookeeper