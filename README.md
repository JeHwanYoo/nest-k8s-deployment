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

```sh
bash ./docker-build.sh
```

You can create a container.

```sh
docker rm -f nestjs-app
docker run --name nestjs-app -d -p 3000:3000 nestjs-app
```

## License

This project is [MIT licensed](LICENSE).
