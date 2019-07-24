#!/usr/bin/env bash

set -ex

CONTROLLER_VERSION="${CONTROLLER_VERSION:-0.3.3}"

kubectl delete -f resources/kudo-deployment.yaml
kubectl delete -f https://raw.githubusercontent.com/kudobuilder/kudo/v${CONTROLLER_VERSION}/docs/deployment/10-crds.yaml
kubectl delete -f https://raw.githubusercontent.com/kudobuilder/kudo/v${CONTROLLER_VERSION}/docs/deployment/00-prereqs.yaml
