#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="petclinic"
COMPOSE_FILE="docker-compose.yml"

echo "==> Bringing down old stack..."
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" down

echo "==> Building and starting stack..."
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" up -d --build

echo "==> Current container status:"
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" ps

echo "==> Waiting a bit for services to settle..."
sleep 15

echo "==> Final status:"
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" ps

echo
echo "Stack started."
echo "Config Server:    http://localhost:8888"
echo "Discovery Server: http://localhost:8761"
echo "API Gateway:      http://localhost:8080"
echo "Customers:        http://localhost:8081"