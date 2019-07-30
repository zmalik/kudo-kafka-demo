#!/usr/bin/env bash
set -e

KUDO_KAFKA_VERSION="${KUDO_KAFKA_VERSION:-0.2.0}"
KUDO_KAFKA_NS="kudo-kafka"


echo "Preparing kafka operator installation using the following system versions"
kubectl version
kubectl kudo version

# use apply so if ns exists it doesn't return any errors
echo "Create kudo-kafka ns"
kubectl apply -f resources/kudo-ns.yaml

echo "Installing zookeeper..."
kubectl kudo install zookeeper --instance=zk --namespace=kudo-kafka --kubeconfig=$KCONFIG

ZOOKEEPER_URI="zk-zookeeper-0.zk-hs:2181,zk-zookeeper-1.zk-hs:2181,zk-zookeeper-2.zk-hs:2181"
echo "Installing kafka..."
kubectl kudo install kafka --version=$KUDO_KAFKA_VERSION \
	--instance=kafka --namespace=kudo-kafka -p ZOOKEEPER_URI=$ZOOKEEPER_URI \
	-p BROKER_CPUS=200m \
    -p BROKER_COUNT=3 \
    -p BROKER_MEM=800m \
    -p DISK_SIZE=10Gi \
    -p MIN_INSYNC_REPLICAS=1 \
    -p NUM_IO_THREADS=10 \
    -p NUM_NETWORK_THREADS=5

