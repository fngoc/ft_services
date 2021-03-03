#!/bin/sh

# minikube stop
# minikube delete
# minikube start --vm-driver=virtualbox
# delet_all.sh

#Установка minikube и metallb
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons list

#Установка nginx
docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

#Установка mysql
docker build -t mysql_image srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

#Установка wordpress
# docker build -t wordpress_image srcs/wordpress
# kubectl apply -f ./srcs/wordpress/wordpress.yaml

#Вызов dashboard
minikube dashboard