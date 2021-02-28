#!/bin/sh

#Установка minikube и metallb
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons list

#Установка nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/nginx/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

#Установка wordpress
# docker build -t wordpress_image srcs/wordpress


#Вызов dashboard
minikube dashboard