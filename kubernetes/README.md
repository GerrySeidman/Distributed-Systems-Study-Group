# Kubernetes

## Kuberentes Site Concepts/Tasks/Tutorials

* [On Different Setups (self/cloud/managed)](https://kubernetes.io/docs/setup/)

* [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)

* [Kubernetes Tasks](https://kubernetes.io/docs/tasks/)

* [Kubernetes Tutorials](https://kubernetes.io/docs/tutorials/)

## Articles on Ubuntu Installation

*  [How to install on Ubuntu 18](https://geekflare.com/install-kubernetes-on-ubuntu/)

## On Networking

* [Nice Article with lots of explanations](https://rancher.com/blog/2019/2019-03-21-comparing-kubernetes-cni-providers-flannel-calico-canal-and-weave/)

## Can the Master also be a worker?
* Yes: [See this posting](https://stackoverflow.com/questions/43147941/allow-scheduling-of-pods-on-kubernetes-master)
```
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## API Objects 

* [API Object Table](Kubernetes-API-Objects.xlsx)

## Fun diagram

![SoftServe Kubernetes](Kubernetes-Softserve.jpg "Cloning a VM")
