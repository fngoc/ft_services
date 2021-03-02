#!/bin/sh

#Установка minikube и metallb
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons list

#Установка nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

#Установка wordpress
# docker build -t wordpress_image srcs/wordpress

#Установка mysql
docker build -t mysql_image srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

#Вызов dashboard
minikube dashboard