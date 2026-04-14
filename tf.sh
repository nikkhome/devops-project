#!/bin/bash

K8S_SERVER="https://172.17.0.1:38285"

docker run --rm \
  --user $(id -u):$(id -g) \
  --network host \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/tmp/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e TF_VAR_k8s_host=$K8S_SERVER \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
