# Kubernetes

## Kuberentes Site Concepts/Tasks/Tutorials

* [On Different Setups (self/cloud/managed)](https://kubernetes.io/docs/setup/)

* [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)

* [Kubernetes Tasks](https://kubernetes.io/docs/tasks/)

* [Kubernetes Tutorials](https://kubernetes.io/docs/tutorials/)

# Understanding Kubernetes 

## API Objects 

* A full description can be here on [API Concepts](ttps://kubernetes.io/docs/reference/using-api/api-concepts/)


* API Object Specification
    *  [Standrd API Terminology](https://kubernetes.io/docs/reference/using-api/api-concepts/#standard-api-terminology) (Directly from the Kubernetes)
        * Kubernetes generally leverages standard RESTful terminology to describe the API concepts:
            * A ___resource type___ is the name used in the URL (pods, namespaces, services)
            * All resource types have a concrete representation in JSON (their object schema) which is called a ___kind___
            * A list of instances of a resource type is known as a ___collection___
            * A single instance of the resource type is called a ___resource___

* Exploring the API Objects
    * Command Line Listing of the Kuberenetes API Objects:
        * ```kubectl api-resources```
    * In this repo, there is an [Excel Spreadsheet listing the Kubernetes API Objects](Kubernetes-API-Objects.xlsx) along with some notes and a categorization column grouping them
    * The ```kubectl explain``` command provides all the fields that belong to the API Objects.  
        * Below is a capture of the output for several API Objects (Kubernetes v1.17)

        * It is best to explore these with an IDE  that has good fold/expand capabilities 
            * such as Visual Studio Code with  ```ctl-K ctl-[``` and ```ctl-K ctl-``` 
        * Explain output for some common API
            * [kubectl explain pod --recursive=true](pod.api)
            * [kubectl explain podTemplate --recursive=true](podTemplate.api)
            * [kubectl explain replicaset --recursive=true](replicaset.api)
            * [kubectl explain deployment --recursive=true](deployment.api)
            * [kubectl explain statefulset --recursive=true](statefulset.api)
             * [kubectl explain podAutoScaper --recursive=true](podAutoScaper.api)
            * [kubectl explain pvc --recursive=true](pvc.api)
            * [kubectl explain pv --recursive=true](pv.api)
            * [kubectl explain storageClass --recursive=true](storageClass.api)
            * [kubectl explain volumeattachment --recursive=true](volumeattachment.api)
            * [kubectl explain configmap --recursive=true](configmap.api)
            * [kubectl explain secret --recursive=true](secret.api)

        * The full API Object Specification can be gotten via the [Kubernetes API Reference Documentation (1.17)](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.17/)

## Book on Kubernetes Internals 

* [Kubebuilder Book](https://kubebuilder.io/)

## Writing a Kuberenetes Operator
* [Ross Soll's KubeBuilder Tutorial at KubeCon 2019](https://youtu.be/KBTXBUVNF2I?list=PLj6h78yzYM2NDs-iu8WU5fMxINxHXlien)
    * [Tutorial Slides Here](https://pres.metamagical.dev/kubecon-us-2019/)
        * Note UX is not obvious. To view next/prev slide just click somewhere on page then use left/right arrows
    * [Code for Tutorial on GitHub](https://github.com/DirectXMan12/kubebuilder-workshops/tree/kubecon-us-2019)

# Other Topics

## Articles on Ubuntu Installation

*  [How to install on Ubuntu 18](https://geekflare.com/install-kubernetes-on-ubuntu/)

## On Networking

* [Nice Article with lots of explanations](https://rancher.com/blog/2019/2019-03-21-comparing-kubernetes-cni-providers-flannel-calico-canal-and-weave/)

## Can the Master also be a worker?
* Yes: [See this posting](https://stackoverflow.com/questions/43147941/allow-scheduling-of-pods-on-kubernetes-master)
```
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Fun diagram

![SoftServe Kubernetes](Kubernetes-Softserve.jpg "Cloning a VM")
