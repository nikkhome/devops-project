#!/bin/bash

docker run --rm -it \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/root/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
