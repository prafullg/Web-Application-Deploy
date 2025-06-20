#!/bin/bash

REGION="ap-south-1"
ACCOUNT_ID="648908580279"
REPO_NAME="praful-dev"
IMAGE="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest"

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker stop praful-app || true
docker rm praful-app || true
docker pull $IMAGE
docker run -d --name praful-app -p 80:5000 $IMAGE
