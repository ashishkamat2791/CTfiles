#!/bin/bash
############################################CLOUD FORMATION(STACK)###############################################
cd ~
cp /home/ubuntu/sampletemplate.yaml .
cp /home/ubuntu/Kubernetes-Dashboard.sh .
aws cloudformation create-stack --stack-name devops-demo-worker-nodes --template-body file://sampletemplate.yaml --capabilities CAPABILITY_IAM
sleep 5m
NodeInstanceRole=$(aws cloudformation describe-stacks --stack-name devops-demo-worker-nodes | grep OutputValue | cut -d '"' -f4)

cd ~/.kube
curl -O https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2018-08-30/aws-auth-cm.yaml
echo $NodeInstanceRole
sed -i "s#<ARN of instance role (not instance profile)>#$NodeInstanceRole#" aws-auth-cm.yaml
KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo
export KUBECONFIG
echo 'export KUBECONFIG=$KUBECONFIG:~/.kube/config-devops-demo' >> ~/.bashrc
kubectl apply -f ~/.kube/aws-auth-cm.yaml
