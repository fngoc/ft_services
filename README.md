# ft_services

## Описание

Этот проект состоит в кластеризации приложения docker-compose и развертывании его с помощью Kubernetes.

## Использование

Перед запуском нужно установить ``VirtualBox`` и ``Minikube``.

Напишите в терминале ``sh setup.sh``, после чего проект соберется.

## Полезные ссылки

[Docker](https://habr.com/ru/company/ruvds/blog/438796/)

[Alpinelinux](https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos)

[Kubernetes](https://kubernetes.io/docs/home/)

[Minikube](https://minikube.sigs.k8s.io/docs/start/)

[MetalLB](https://metallb.universe.tf/)

[Изучение объектов Kubernetes](https://kubernetes.io/ru/docs/concepts/overview/working-with-objects/kubernetes-objects/)

[Изучение подов и узлов](https://kubernetes.io/ru/docs/tutorials/kubernetes-basics/explore/explore-intro/)

[Pods](https://kubernetes.io/docs/concepts/workloads/pods/)

[Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

[Service](https://kubernetes.io/docs/concepts/services-networking/service/)

[PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume)

[PersistentVolumeClaim](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim)

[Notion](https://www.notion.so/ft_services-e0700a527d0d45039388f65087c23b21)

## Полезная информация

Minikube — инструмент, который создает виртуальную машину на вашей локальной машине и разворачивает кластер Kubernetes c одним узлом. То есть нам нужно установить на нашу физическую машину Minikube, запуск которого развернет Kubernetes.

Кластер — это среда в котором работает Kubernetes. Минимальный кластер состоит из одного узла.

Узел (Node) — это отдельная физическая или виртуальная машина, на которой развернуты и выполняются контейнеры приложений.

MetalLb — это реализация балансировщика нагрузки (LoadBalancer) для кластеров Kubernetes на «голом железе» со стандартными протоколами маршрутизации.

LoadBalancer — один из типов сервиса (Service). Его главная цель в нашем проекте выдавать нашим сервисам фиксированные внешние ip-адреса.

Service — абстракция, определяющая политику доступа к подам (Pod). Имеет 4 основных типа: ClusterIP, NodePort, LoadBalancer и ExternalName. Более подробную информацию можете прочитать [здесь](https://kubernetes.io/ru/docs/tutorials/kubernetes-basics/expose/expose-intro/).

Deployment - контройлер развертывания.

Pod — это наименьший функциональный юнит в Kubernetes. Состоит из одного или нескольких контейнеров, хранилища (storage), отдельного IP-адреса и опций, которые определяют, как именно контейнеры должны запускаться.

## Оценка

![alt tag](media/appraisal_ft_services.png "Оценка проекта ft_services")
