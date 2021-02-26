#!/bin/sh

eval $(minikube docker-env)
minikube addons enable metallb
minikube addons list
docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/nginx/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
minikube dashboard