#!/usr/bin/env bash
set -e

CONTROLLER_VERSION="${CONTROLLER_VERSION:-0.5.0}"

VERSION=`kubectl kudo version | cut -b 40-44`

echo "Preparing kudo installation using the following system versions"
kubectl --kubeconfig=$KUBECONFIG version
kubectl kudo version

echo "Installing prereqs"
kubectl apply -f https://raw.githubusercontent.com/kudobuilder/kudo/v${CONTROLLER_VERSION}/docs/deployment/00-prereqs.yaml

echo "Installing CRDs"
kubectl apply -f https://raw.githubusercontent.com/kudobuilder/kudo/v${CONTROLLER_VERSION}/docs/deployment/10-crds.yaml

echo "Installing KUDO operator"
kubectl apply -f https://raw.githubusercontent.com/kudobuilder/kudo/v${CONTROLLER_VERSION}/docs/deployment/20-deployment.yaml

