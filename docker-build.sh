#!/usr/bin/env bash

# Enable Minikube's Docker daemon
eval "$(minikube docker-env)"

# Build Docker Image
docker build -t nestjs-app:latest .
