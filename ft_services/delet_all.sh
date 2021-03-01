#!/bin/bash

#Удоляем сервисы, диплои и подсы
kubectl delete --all svc
kubectl delete --all deployments
kubectl delete --all pods