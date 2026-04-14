#!/bin/bash

docker run --rm \
  --user $(id -u):$(id -g) \
  --network host \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/tmp/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e KUBECONFIG=/tmp/.kube/config \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
