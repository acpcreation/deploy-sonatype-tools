#!/usr/bin/env bash
# chmod +x configure-container.sh 
# install docker
# install awscli

# USAGE: ./configure-container.sh <ECR_REPO_URI>

# CONTAINER_NAME="sonatype/nexus3"
# CONTAINER_NAME="sonatype/nexus-iq-server"
CONTAINER_NAME="a3c57af0d437"

CONTAINER_TAG="latest"
# echo "Pull Docker Image..."
# docker pull $CONTAINER_NAME

echo "Tag Docker Image..."
docker tag $CONTAINER_NAME $1:$CONTAINER_TAG
TAGGED_IMAGE="$1:$CONTAINER_TAG"
echo "Tagged Image: $TAGGED_IMAGE"

echo "Login to ECR: $1"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $1

echo "Pushing Docker Image to ECR: $1"
docker push $TAGGED_IMAGE