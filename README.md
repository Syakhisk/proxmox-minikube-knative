# Proxmox Minikube Knative - Proof of Concept Serverless

This repository is a guide based on my final research project for my degree at Institut Teknologi Sepuluh Nopember. This guide will show you how to deploy [Knative](https://knative.dev/) on [Proxmox](https://www.proxmox.com/en/) using [Minikube](https://minikube.sigs.k8s.io/docs/). There will be also a guide to deploy a conventional system on the same Proxmox server.

> This implementation is just a proof of concept, so it is not recommended to use this guide **AS IS** in production. Use other Kubernetes implementation such as [K3s](https://k3s.io/) or [MicroK8s](https://microk8s.io/) for production.

## Terminologies

- **Serverless System** - A system that uses Knative as the serverless platform, and the system is deployed on the Kubernetes cluster that is hosted on the Proxmox server.
- **Conventional System** - A system that is deployed on the Proxmox server. The system will have 5 web servers and 1 load-balancer/reverse-proxy server.

## Technology Used

- [Proxmox](https://www.proxmox.com/en/) (tested on version 7.3-3) - A virtualization platform based on Debian, used to host the Kubernetes cluster and Conventional system.
- [Minikube](https://minikube.sigs.k8s.io/docs/) (tested on version 1.30.1) - A tool that makes it easy to run Kubernetes.
- [Knative](https://knative.dev/) (tested on version 1.10.1) - A Kubernetes-based platform to build, deploy, and manage modern serverless workloads.
- [Docker](https://www.docker.com/) (tested on version 24.0.2) - A set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.
- [Caddy](https://caddyserver.com/) (tested on version 2.6.4) - A powerful, enterprise-ready, open source web server with automatic HTTPS written in Go.
- [BIND](https://www.isc.org/bind/) (tested on version 9.16.15) - The most widely used Domain Name System (DNS) software on the Internet.

## Architecture

### Conventional System
![Architecture](./assets/architecture-conventional.drawio.svg)

| Description   | CPU | RAM   | Hostname | IP        | User   | Password |
| ------------- | --- | ----- | -------- | --------- | ------ | -------- |
| web-server    | 1   | 512M  | kenobi-1 | 10.0.0.30 | ubuntu | ubuntu   |
| web-server    | 1   | 512M  | kenobi-2 | 10.0.0.31 | ubuntu | ubuntu   |
| web-server    | 1   | 512M  | kenobi-3 | 10.0.0.32 | ubuntu | ubuntu   |
| web-server    | 1   | 512M  | kenobi-4 | 10.0.0.33 | ubuntu | ubuntu   |
| web-server    | 1   | 512M  | kenobi-5 | 10.0.0.34 | ubuntu | ubuntu   |
| load-balancer | 1   | 1024M | kenobi-6 | 10.0.0.35 | ubuntu | ubuntu   |



### Kubernetes Cluster and Knative
![Architecture](./assets/architecture-serverless.drawio.svg)

| Description   | CPU | RAM   | Hostname | IP        | User   | Password |
| ------------- | --- | ----- | -------- | --------- | ------ | -------- |
| kubernetes    | 6   | 8192M  | grogu | 10.0.0.10 | ubuntu | ubuntu   |

## Guide

### Proxmox

Assumed that you have installed Proxmox on your machine or have access to a Proxmox server. If you haven't, you can follow the [official guide](https://pve.proxmox.com/wiki/Installation).


### Conventional System

#### Create VM Template

1. Access the Proxmox root shell using SSH or the web shell. So, most of the commands in this guide will be executed on the Proxmox root shell.

2. Download Ubuntu Server 20.04 LTS Cloud Image from [Ubuntu Cloud Images](https://cloud-images.ubuntu.com/jammy/current/)

```bash
curl -o jammy-server.img https://cloud-images.ubuntu.com/jammy/20230405/jammy-server-cloudimg-amd64.img
```

3. Modifying the image

  By default, this image have 2GB of disk size. We'll resize it to 10GB.

  To check the image info using `qemu-img` command.

  ```bash
  qemu-img info jammy-server.img
  ```

```
root@pve:~# qemu-img info jammy-server.img
image: jammy-server.img
file format: qcow2
virtual size: 2.2 GiB (2361393152 bytes)
disk size: 653 MiB
cluster_size: 65536
Format specific information:
compat: 0.10
compression type: zlib
refcount bits: 16
```


3. Create a new VM Template on Proxmox

We'll use the `qm` command to create a new VM template. I've created a script to make it easier to create a new VM template. You can download the script from [here](./scripts/create-vm-template.sh).

```bash
```

