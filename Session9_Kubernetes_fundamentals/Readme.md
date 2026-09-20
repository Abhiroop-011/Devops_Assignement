# Session 9 - Kubernetes Fundamentals

**Name:** Abhiroop Sistu
**RollNo:** 24bcs10287
**Session:** 09 - Kubernetes Fundamentals

---

## Task 1 - Minikube and Kubectl Installation

Minikube is used to run a Kubernetes cluster locally. `kubectl` is used to interact with the cluster.

### Commands

```bash
minikube version
kubectl version --client
```


### Screenshot


![Minikube and Kubectl Version](./Screenshots/Screenshot%202026-09-20%20205155.png)

---

## Task 2 - Start Minikube Cluster

Start a local Kubernetes cluster using Minikube.

### Command

```bash
minikube start
```

### Screenshot

![Minikube Start](./Screenshots/Screenshot%202026-09-20%20205457.png)

---

## Task 3 - Check Cluster Status

Check whether the Minikube cluster and Kubernetes node are running correctly.

### Commands

```bash
minikube status
kubectl get nodes
```

### Screenshot

![Minikube Status](./Screenshots/Screenshot%202026-09-20%20205530.png)

---

## Task 4 - Stop Minikube Cluster

Stop the Minikube cluster properly after completing the work.

### Commands

```bash
minikube stop
minikube status
```

### Screenshot

![Minikube Stop](./Screenshots/Screenshot%202026-09-20%20205610.png)

---

# Kubernetes Architecture

Kubernetes mainly has two parts:

* **Control Plane**
* **Worker Node**

The Control Plane manages the cluster. Worker Nodes run the applications.

## 1. Control Plane

### kube-apiserver

`kube-apiserver` is the main entry point to the Kubernetes cluster.

Commands from `kubectl` are sent to the API server. Other Kubernetes components also communicate through it.

### etcd

`etcd` stores the Kubernetes cluster information and current state.

It contains information about objects such as Pods, Services and configurations.

### kube-scheduler

The `kube-scheduler` decides which Worker Node should run a new Pod.

It considers available resources such as CPU and memory.

### kube-controller-manager

The `kube-controller-manager` continuously checks whether the actual state of the cluster matches the desired state.

For example, if 3 Pods are required and one stops, the controller helps bring the number back to 3.

---

## 2. Worker Node

### kubelet

`kubelet` is the main agent running on a Worker Node.

It receives Pod information and makes sure the required containers are running.

### kube-proxy

`kube-proxy` handles network communication for Services and helps route traffic to the correct Pods.

### Container Runtime

The Container Runtime is responsible for running containers.

Examples:

* `containerd`
* `CRI-O`

### Pod

A Pod is the smallest deployable unit in Kubernetes.

It contains one or more containers where the application runs.

---

## How They Work Together

```text
                  CONTROL PLANE
              +--------------------+
              |                    |
              |  kube-apiserver    |
              |       |            |
              |   +---+---+        |
              |   |       |        |
              |  etcd  scheduler   |
              |       |            |
              | controller-manager  |
              +-------|------------+
                      |
                      v
                 WORKER NODE
              +--------------------+
              |                    |
              |      kubelet       |
              |         |          |
              |         v          |
              | Container Runtime  |
              |         |          |
              |         v          |
              |        Pods        |
              |                    |
              |    kube-proxy      |
              +--------------------+
```

The basic flow is:

`kubectl → kube-apiserver → Control Plane → Worker Node → kubelet → Container Runtime → Pod`

---

