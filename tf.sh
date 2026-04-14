#!/bin/bash

K8S_SERVER="https://172.17.0.1:38285"

docker run --rm \
  --user $(id -u):$(id -g) \
  --network host \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/tmp/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e TF_VAR_k8s_host=$K8S_SERVER \
  -e TF_VAR_k8s_token="eyJhbGciOiJSUzI1NiIsImtpZCI6IjNoS0JNaVoyS1lwWmRnSzMyZnloZlRWc0ZRdUYzQ3dpNEw2QzNnZXVUbzgifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiLCJrM3MiXSwiZXhwIjoxNzc2MTk5ODYwLCJpYXQiOjE3NzYxOTYyNjAsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwianRpIjoiZDA5YTA1YTEtYjQ3NC00ZTYyLTk1ZGMtNmQxMzJlMjExM2NkIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0Iiwic2VydmljZWFjY291bnQiOnsibmFtZSI6ImRlZmF1bHQiLCJ1aWQiOiJlOWNlNzFiYi1kNDhjLTRhNDEtYjdkNy03NjliNTg2Y2Y2MWQifX0sIm5iZiI6MTc3NjE5NjI2MCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.iYh_xouPKOvvaDbN53fKD_7ltbCqsPSh7RVQIt7Wdm3Urx_NNNiGkLpOVGoxFUmaJhC1g_gwIJUpqceJAx_gh3Y-7zU93k5zEPWsnFQ28zUhWGU0zsNlbP23LX2BbEsh_mq_-jZlBBPWGGu6VFZVVNlXjhxNJLBagM61Kz2VG5Ax1xKkO3kKU6inoB6LVP95hhxShtBLpiQpnSPXvUK2VbPkEO8fwXKjrWFeA-guTmdvDAJb5jgcD-UtC_-O9juL4bnzZ6v4NCQwYtAIL6SKnZl0xmPQGM_-sony7IBVG63q2qOEKy3012KX6n4yIo0XGXfyyyKVaFxb-mUyAbJQYQ" \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
