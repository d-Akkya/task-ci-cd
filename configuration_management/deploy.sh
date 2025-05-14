#!/bin/bash

set -e

APP_REPO="https://github.com/d-Akkya/task-ci-cd.git"
APP_DEST="/opt/apache-nginx-app"

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y git docker.io docker-compose

echo "Cloning application repository..."
sudo rm -rf "$APP_DEST"
git clone "$APP_REPO" "$APP_DEST"
cd "$APP_DEST"

echo "Building and starting containers..."
sudo docker-compose up -d --build

echo "Verifying container health..."
for container in apache-container-1 apache-container-2 apache-container-3 nginx; do
    STATUS=$(sudo docker inspect --format='{{.State.Health.Status}}' "$container" 2>/dev/null || echo "unavailable")
    echo "$container health status: $STATUS"
done

echo "Deployment complete."
