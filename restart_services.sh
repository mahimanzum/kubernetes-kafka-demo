#!/bin/bash
kubectl delete service zookeeper
kubectl delete statefulset zookeeper
kubectl delete service kafka
kubectl delete statefulset kafka
echo "Waiting for Zookeeper and kafka to die ..."
kubectl wait --for=delete pod/zookeeper-0 --timeout=120s
kubectl wait --for=delete pod/kafka-0 --timeout=120s

kubectl apply -f zookeeper-statefulset.yaml
kubectl apply -f zookeeper-service.yaml

echo "Waiting for Zookeeper to be ready..."
kubectl wait --for=condition=ready pod -l app=zookeeper --timeout=60s

echo "delete and restart kafka service and statefulset"

kubectl apply -f kafka-statefulset.yaml
kubectl apply -f kafka-service.yaml

echo "Waiting for Kafka to be ready..."
kubectl wait --for=condition=ready pod kafka-0 --timeout=120s
# echo "Waiting for kafka terminal to be live"
# sleep 30
echo "scaling kafka partitions"
kubectl exec kafka-0 -- ./bin/bash -c "kafka-topics.sh --bootstrap-server kafka:9092 --create --topic test-topic --partitions 4 --replication-factor 1"
# kubectl exec -it kafka-0 -- /bin/bash
# test topic creation
# kafka-topics.sh --bootstrap-server kafka:9092 --describe --topic test-topic

echo "Done."
