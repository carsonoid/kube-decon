#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh -n $@

export TYPE_SPEED=50

# hide the evidence
clear
p "# Press enter to start demo."
wait

# Setup cluster
p "# Configure kubectl with imperatives"
p "# ------------"
#pe "kubectl config"
p "kubectl config set-credentials kubecon17-auth --token=REDACTED"
kubectl config set-credentials kubecon17-auth --token=$(cat ./admin.token)
p
p "kubectl config set-cluster kubecon17-cluster --server=https://master.kubecon.carson-anderson.com  --certificate-authority=./ca.crt --embed-certs=true"
kubectl config set-cluster kubecon17-cluster --server=https://master.kubecon.carson-anderson.com  --insecure-skip-tls-verify=true
p
pe "kubectl config set-context kubecon17 --cluster=kubecon17-cluster --user=kubecon17-auth"
pe "kubectl config use-context kubecon17"
p
p "# Press enter to create resources!"
wait

clear
# Create resources
p "# Create Resources"
p "# ------------"
p "# Create a namespace for the project"
pe "kubectl create namespace kube-decon"
p
p "# Create the pods via a deployment"
pe "kubectl --namespace=kube-decon create -f resources/basic/kube-decon-deployment.yaml"
p
p "# Expose the pods via a service"
pe "kubectl --namespace=kube-decon create -f resources/basic/kube-decon-service.yaml"
p
p "# Route a hostname to the service via ingress"
pe "kubectl create -f resources/basic/kube-decon-ingress.yaml"
p
wait

while :; do
    clear
    pe "kubectl --namespace=kube-decon get deployment,pods,service,ingress"
    kubectl --namespace=kube-decon get po |grep -q Running && break
done
