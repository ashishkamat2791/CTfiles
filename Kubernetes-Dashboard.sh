#!/bin/bash
#sudo -i
sudo apt-get update -y
sudo apt-get install lxde -y
sudo start lxdm
sudo apt-get install xrdp -y

KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo
export KUBECONFIG
echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo' >> ~/.bashrc

