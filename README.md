# ft_services

## Description

Deploying a Kubernetes cluster with 7 independent services, each in its own pod. External access only through Load Balancer. Access is open only to nginx, phpmyadmin, wordpress, ftps, grafana.

If the process in the container or the container crashes, pod will restart itself. At the same time, data in databases (mysql and influxdb) should not be lost. DB are stored on the cluster itself using PersistentVolume and PersistentVolumeClaim.

The entire assembly process is carried out in ``setup.sh``

## Using

Before starting, you need to install ``VirtualBox`` and ``Minikube``.

Write in the terminal ``sh setup.sh``, after which the project will be assembled.

## Useful commands

| Description | Command |
| --- | --- |
|Installing or reinstalling minikube |brew reinstall minikube|
| Start minikube and create cluster | minikube start |
| Start minikube and create cluster on vm | minikube start --vm-driver=virtualbox |
| Delete minikube | minikube delete |
| Get all worker nodes/pods/services/deploys | kubectl get nodes/pods/svc/deploy |
| Go inside the cluster | minikube ssh |
| Switch docker to work inside the cluster | eval $(minikube docker-env) |
| Activate the specified addon | minikube addons enable "name" |
| Apply the specified k8s setting in the file "file.yaml" | kubectl apply -f file.yaml |
| Remove smth | kubectl delete pod/deploy/svc "name" | 
| See logs of pod| kubectl logs "podname" |
| See pod/svc/deploy info | kubectl describe pod/svc/deploy "name" |
| Kill process "nginx" on "nginxpod" | kubectl exec "nginxpod" -- pkill nginx |

## Useful links

[Docker](https://habr.com/ru/company/ruvds/blog/438796/)

[Alpinelinux](https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos)

[Kubernetes](https://kubernetes.io/docs/home/)

[Minikube](https://minikube.sigs.k8s.io/docs/start/)

[MetalLB](https://metallb.universe.tf/)

[Exploring Kubernetes Objects](https://kubernetes.io/ru/docs/concepts/overview/working-with-objects/kubernetes-objects/)

[Study of pods and nodes](https://kubernetes.io/ru/docs/tutorials/kubernetes-basics/explore/explore-intro/)

[Pods](https://kubernetes.io/docs/concepts/workloads/pods/)

[Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

[Service](https://kubernetes.io/docs/concepts/services-networking/service/)

[PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume)

[PersistentVolumeClaim](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim)

[Notion](https://www.notion.so/ft_services-e0700a527d0d45039388f65087c23b21)

## Useful information

Minikube is a tool that creates a virtual machine on your local machine and deploys a Kubernetes cluster with a single node. That is, we need to install a Minikube on our physical machine, the launch of which will deploy Kubernetes.

A cluster is an environment in which Kubernetes runs. The minimum cluster consists of one node.

A Node is a separate physical or virtual machine on which application containers are deployed and run.

MetalLB is an implementation of a load balancer for Kubernetes clusters with standard routing protocols.

LoadBalancer is one of the Service types. Its main goal in our project is to give our services fixed external ip addresses.

Service - an abstraction that defines the Pod access policy. It has 4 main types: ClusterIP, NodePort, LoadBalancer, and ExternalName. For more information, please read [here](https://kubernetes.io/ru/docs/tutorials/kubernetes-basics/expose/expose-intro/).

Deployment - deployment controller.

Pod is the smallest functional unit in Kubernetes. It consists of one or more containers, storage, a separate IP address, and options that define how the containers should be started.
