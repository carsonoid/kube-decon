#!/bin/bash
# cleanup prior to demo

kubectl config use-context kubecon17
kubectl delete -f resources/basic
kubectl delete namespace webhelpers
kubectl delete namespace kube-decon
