# Nest + K8S

<div style="display: flex; justify-content: center; align-items: center; gap: 24px;">
    <a href="https://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
    <a href="https://kubernetes.io/" target="_blank"><img src="https://avatars.githubusercontent.com/u/13629408?s=200&v=4" width="200" alt="Kubernetes Log" /></a>
</div>

<div style="text-align: center; font-weight: bold; font-size: 1.5rem;">
    Practicing deploying Nest.js using Kubernetes.
</div>

## Installation

```bash
$ pnpm install
```

## Running the app

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

## Test

```bash
# unit tests
$ pnpm run test

# e2e tests
$ pnpm run test:e2e

# test coverage
$ pnpm run test:cov
```

## Deployment using k8s

### Prerequisite

Minikube is used as a cluster for k8s.

#### mac os

```sh
brew install kubectl
brew install minikube

minikube start
```

#### others

- [minikube start](https://minikube.sigs.k8s.io/docs/start/)

### Build Docker Image

When building Docker, the Minikube context is used.

```
# Enable Minikube's Docker daemon
eval "$(minikube docker-env)"

# Build Docker Image
docker build -t nestjs-app:latest .
```

simply,

```sh
# in repository
bash ./docker-build.sh
```

### Deploy using the Minikube

You can apply a deployment and a service.

```sh
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service-node-port.yaml
# 또는 kubectl apply -f k8s/service-load-balancer.yaml
```

Now, you can retrieve the external access URL of the service

```sh
minikube service nestjs-app-service --url
```

Finally, you can delete the service and the deployment

```sh
kubectl delete service nestjs-app-service
kubectl delete deployment nestjs-app-deployment
```

### Check the status of the cluster

```sh
minikube dashboard --url
```

![Dashboard](assets/Kubernetes%20Dashboard.jpeg)

## LoadBalancer Service in Local

When a `LoadBalancer` service type is displayed as `Pending` status, it typically indicates that the Kubernetes cluster
environment has not completed the provisioning of the actual load balancer resource. In cloud environments (e.g., AWS,
Google Cloud, Azure, etc.), when you create a `LoadBalancer` service, the cloud provider automatically allocates an
external load balancer and associates an external IP address with the service. Once this process is completed, the
service status changes from `Pending` to a state where an external IP is assigned.

However, **in local environments**, such as when using Minikube, provisioning a real cloud provider's load balancer is
not possible. Tools like Minikube are designed for local development and cannot create load balancers in the same manner
as real cloud infrastructure. Therefore, even though you might use the `LoadBalancer` service type, an actual external
load balancer is not created, and the service status remains `Pending`.

**But this doesn't mean the service won't work in a local environment.** Minikube provides a feature through
the `minikube tunnel` command that enables access to `LoadBalancer` services. The `minikube tunnel` command facilitates
traffic routing for LoadBalancer type services on the local machine and, if necessary, assigns a virtual external IP
address to simulate load balancer functionality. This allows developers to test and use `LoadBalancer` services in a
local environment.

In summary, it is normal for a `LoadBalancer` service to be marked as `Pending` in a local environment. This status
indicates that an actual load balancer resource has not been provisioned, but tools like `minikube tunnel` enable local
access to and testing of the service.

## License

This project is [MIT licensed](LICENSE).
