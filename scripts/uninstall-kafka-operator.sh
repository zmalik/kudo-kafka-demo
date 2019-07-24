#!/usr/bin/env bash

set -x

kubectl delete instance zk -n kudo-kafka
kubectl delete instance kafka -n kudo-kafka
kubectl delete operatorversion zookeeper-0.1.0 -n kudo-kafka
kubectl delete operator zookeeper -n kudo-kafka
kubectl delete operatorversion kafka-0.1.1 -n kudo-kafka
kubectl delete operator kafka -n kudo-kafka
