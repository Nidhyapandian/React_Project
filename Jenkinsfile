pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x build.sh'
        sh './build.sh'
      }
    }
     stage('Deploy') {
            steps {
          
          withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
          sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin docker.io"
          
                script {
                    def BRANCH_NAME = env.GIT_BRANCH.split('/').last()
                    echo "Current branch is: ${BRANCH_NAME}"
                  sh 'docker-compose down'               
                 if ( "${BRANCH_NAME}" == "dev" ) {
                      sh 'chmod +x build.sh'
                      sh './build.sh'
                      echo "Changes in dev branch"            
                      sh 'docker tag nginximage smart24/dev'
                      sh 'docker push smart24/dev'
                      echo "Docker image pushed successfully."
                 } else if ( "${BRANCH_NAME}" == "main" ) {
                      sh 'chmod +x build.sh'
                      sh './build.sh'
                      echo "Changes in main branch"
                      sh 'docker tag nginximage smart24/prod'
                      sh 'docker push smart24/prod'
                      echo "Docker image pushed successfully."
                } else {
                  echo "Branch not configured for deployment"  exit 1 
                  }
            
                }
            }
        }
     
        }
      }
}   
    
  
    

  






