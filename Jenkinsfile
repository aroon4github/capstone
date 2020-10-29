pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/aroon4github/capstone.git', branch:'main'
      }
    }
     stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("aroon4docker/capstone-whale:${env.BUILD_ID}")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
