#!/bin/bash

docker rmi $(docker images -a -q)
kubectl delete --all svc
kubectl delete --all deployments
kubectl delete --all pods
