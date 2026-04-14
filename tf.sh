#!/bin/bash

docker run --rm \
  --user $(id -u):$(id -g) \
  --network host \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/root/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
