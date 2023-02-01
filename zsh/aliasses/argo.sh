#!/usr/bin/env bash

argt() {
  SECRET=$(kubectl get sa argo-ui --namespace argo -o=jsonpath='{.secrets[0].name}')
  ARGO_TOKEN="Bearer $(kubectl get secret $SECRET --namespace argo -o=jsonpath='{.data.token}' | base64 --decode)"
  echo $ARGO_TOKEN
}
