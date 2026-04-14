#!/bin/bash

K8S_SERVER="https://172.17.0.1:38285"

docker run --rm \
  --user $(id -u):$(id -g) \
  --network host \
  -v $(pwd):/workspace \
  -v $HOME/.kube:/tmp/.kube \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e TF_VAR_k8s_host=$K8S_SERVER \
  -e TF_VAR_k8s_token="eyJhbGciOiJSUzI1NiIsImtpZCI6IjNoS0JNaVoyS1lwWmRnSzMyZnloZlRWc0ZRdUYzQ3dpNEw2QzNnZXVUbzgifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiLCJrM3MiXSwiZXhwIjoxNzc2MTk1OTgwLCJpYXQiOjE3NzYxOTIzODAsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwianRpIjoiNGFiODZjNjMtN2VlNC00ZmQ0LTg2OWMtZDA0NzE1YjY0OWE1Iiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0Iiwic2VydmljZWFjY291bnQiOnsibmFtZSI6ImRlZmF1bHQiLCJ1aWQiOiJlOWNlNzFiYi1kNDhjLTRhNDEtYjdkNy03NjliNTg2Y2Y2MWQifX0sIm5iZiI6MTc3NjE5MjM4MCwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50OmRlZmF1bHQ6ZGVmYXVsdCJ9.WwsezpF9bT--2DSY-MBtvHHzA5ZTSdXEPH2wytAzMRmX5ZoAa0q6quk38yuVJmZqErteBhF4SUW_we6q8HLq8M9TqB91rC0UmjoygXExYydF4mT2ewRQ6fC_if1O_thbHgWJRy7Bu5Kimosta_qstpoRee_XpyzTG2XASGvYBgapb1WAnNrYoR-YPRPk7r8iIys3-YVFmp7J9y7GvIEUxNEhLepwG4fqOhVZHieJnkCb_qGtQZihocmC4Zkg_R3TCuqqJpuY3uYqkynGqXyqlb0_MmPh0vbXM4OpiCj5g_N7Zp3bmv7y73bRQTlGkDtGA7soc4YSntxihjDBTMaEDA" \
  -w /workspace/infra \
  hashicorp/terraform:latest "$@"
