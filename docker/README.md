# Docker Containers

## Installing Docker

* [Onto Ubuntu (from Docker Site)](https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu)

* [Deploy a Private Docker Registery (from Docker Site)] (https://docs.docker.com/registry/deploying/)
    * NOTE: Only do this onto ONE VM (not all)
## External Links

* [Docker Documentation](https://docs.docker.com)
* [Docker Cheat Sheet](https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index)
* [DockerFile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [ContainerTutorials.com](http://containertutorials.com/)
* [Managing Data with Docker](https://docs.docker.com/storage/)
* [Docker OverlayFS](https://docs.docker.com/storage/storagedriver/overlayfs-driver/)
* [What a Linux Container Really: Namespaces and cgroups](https://jvns.ca/blog/2016/10/10/what-even-is-a-container/)

## Tutorial that we are following
* [ContainerTutorials.com](http://containertutorials.com/)

## Understanding Docker Garbage Collection

* Innevitably early docker users find that their disks are filling
* It is important to understand:
    * What remains on disk when containers terminate?
    * What lingers in your local repository?
    * What lingers in your Docker registries?
* See some of the scripts (below) . 
    * There are useful scripts for exploring/understanding what is going on
    * There are useful scripts for cleaning up your disks/registries

## Gerry's Docker Scripts

* Docker Basics

    * [dr: Docker Run ](dockerScripts/dr)
    * [dx: Docker Execute  ](dockerScripts/dx)

    * [dps: Docker PS ](dockerScripts/dps)
    * [dpsa: Docker PS All ](dockerScripts/dpsa)

* Docker Repository (Local)
    * [sdi: Show Docker Images](dockerScripts/sdi)

    * [rdi: Remove Docker Images](dockerScripts/rdi)
    * [rdxi: Remove Exited Images](dockerScripts/rdxi)

* Docker Registry (Private)

    * [bcp: Build - Tag - Push](dockerScripts/bcp)

    * [drs: Docker Registry Show](dockerScripts/drs)
    * [drm: Docker Registry Manifest](dockerScripts/drm)
    * [drt: Docker Registry Tag](dockerScripts/drt)
    * [drgcdr: Garbage Collect Registry (only registry host)](dockerScripts/drgcdr)

