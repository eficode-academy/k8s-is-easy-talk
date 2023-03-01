#!/usr/bin/env bash

# create namespace
kubectl create namespace argocd

# add argo helm repository
helm repo add argo https://argoproj.github.io/argo-helm

# install argocd using helm
helm --namespace argocd install argocd argo/argo-cd
