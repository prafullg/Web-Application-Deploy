#!/bin/bash

REGION="ap-south-1"
ACCOUNT_ID="648908580279"
REPO_NAME="praful-dev"
IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

echo "Logging in to ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Stopping and removing old container (if any)..."
docker stop praful-app || true
docker rm praful-app || true

echo "Pulling latest image..."
docker pull $IMAGE

echo "Running container on port 80..."
docker run -d --name praful-app -p 80:5000 $IMAGE
