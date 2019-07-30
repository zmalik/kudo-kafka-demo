#!/usr/bin/env bash

set -x

KUDO_KAFKA_VERSION="${KUDO_KAFKA_VERSION:-0.2.0}"

kubectl delete instance zk -n kudo-kafka
kubectl delete instance kafka -n kudo-kafka
kubectl delete operatorversion zookeeper-0.1.0 -n kudo-kafka
kubectl delete operator zookeeper -n kudo-kafka
kubectl delete operatorversion kafka-${KUDO_KAFKA_VERSION} -n kudo-kafka
kubectl delete operator kafka -n kudo-kafka
