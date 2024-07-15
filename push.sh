#!/bin/bash
#def BRANCH_NAME = env.GIT_BRANCH.split('/').last()

# Define BRANCH_NAME using env.GIT_BRANCH

def BRANCH_NAME = env.GIT_BRANCH.split'/'.last()
echo "Current branch name: ${BRANCH_NAME}"

if ["$BRANCH_NAME"="dev"]; then
        ./build.sh
        DOCKER_REPO="smart24/myapp-dev"
        docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
        docker push $DOCKER_REPO:${BUILD_NUMBER}
        docker push $DOCKER_REPO:latest
elif ["$BRANCH_NAME"="main"]; then
        ./build.sh
        DOCKER_REPO="smart24/myapp-prod"
        docker tag myapp:${BUILD_NUMBER} $DOCKER_REPO:${BUILD_NUMBER}
        docker push $DOCKER_REPO:${BUILD_NUMBER}
        docker push $DOCKER_REPO:latest
else echo "Branch not configured for deployment" exit 1
fi 
