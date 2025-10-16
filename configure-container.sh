#!/usr/bin/env bash
# chmod +x configure-container.sh 
# install docker
# install awscli

# USAGE: ./configure-container.sh <CONTAINER_NAME> <ECR_REPO_URI>
# EXAMPLE: ./configure-container.sh sonatype/nexus3 470037505301.dkr.ecr.us-east-1.amazonaws.com/aplattel-container-registry

# CONTAINER_NAME="sonatype/nexus3"
# CONTAINER_NAME="sonatype/nexus-iq-server"
CONTAINER_NAME=$1
ECR_REPO_URI=$2


CONTAINER_TAG="latest"
echo "Pull Docker Image..."
docker pull $CONTAINER_NAME

echo "Tag Docker Image..."
docker tag $CONTAINER_NAME $ECR_REPO_URI:$CONTAINER_TAG
TAGGED_IMAGE="$ECR_REPO_URI:$CONTAINER_TAG"
echo "Tagged Image: $TAGGED_IMAGE"

echo "List Available ECR Repositories..."
# aws ecr describe-repositories

echo "Login to ECR: $ECR_REPO_URI"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO_URI

echo "Pushing Docker Image to ECR: $ECR_REPO_URI"
docker push $TAGGED_IMAGE


# echo "Scanning Terraform with Checkov..."
# docker run --tty --volume $(pwd):/tf --workdir /tf bridgecrew/checkov --directory /tf --output json > checkov-report.json

echo "Complete!"