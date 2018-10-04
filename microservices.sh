#!/bin/bash
sleep 40s
cd /home/ubuntu/
KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo
export KUBECONFIG
echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo' >> ~/.bashrc
kubectl create -f microservices.yaml
