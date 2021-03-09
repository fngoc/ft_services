#!/bin/bash

#Удалить файл ssh
# ssh-keygen -f "/Users/fngoc/.ssh/known_hosts" -R 192.168.99.104

# minikube stop
# minikube delete

# Удалить сервисы, деплойменты и подсы
kubectl delete --all svc
kubectl delete --all deployments
kubectl delete --all pods