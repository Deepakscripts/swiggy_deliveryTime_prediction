#!/bin/bash
# Log everything to start_docker.log
exec > /home/ubuntu/start_docker.log 2>&1

echo "Logging in to ECR..."
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 266735837585.dkr.ecr.ap-south-1.amazonaws.com

echo "Pulling Docker image..."
docker pull 266735837585.dkr.ecr.ap-south-1.amazonaws.com/swiggy-delivery-time-prediction-project-ecr:latest

echo "Checking for existing container..."
if [ "$(docker ps -q -f name=swiggydockerimage)" ]; then
    echo "Stopping existing container..."
    docker stop swiggydockerimage
fi

if [ "$(docker ps -aq -f name=swiggydockerimage)" ]; then
    echo "Removing existing container..."
    docker rm swiggydockerimage
fi

echo "Starting new container..."
docker run -d -p 80:8000 --name swiggydockerimage -e DAGSHUB_USER_TOKEN=c3fe3190720a4a70d023dc4290011c7d0a4df7e3 266735837585.dkr.ecr.ap-south-1.amazonaws.com/swiggy-delivery-time-prediction-project-ecr:latest

echo "Container started successfully."