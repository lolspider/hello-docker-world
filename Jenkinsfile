pipeline {
    agent any
    stages {
        stage("git checkout tag") {
            steps {
                script {
                    sh 'git checkout "$tagversion"'
                }
            }
        }
        stage("gradle build") {
            steps {
                script {
                    sh './gradlew build'
                }
            }
        }
	       stage("build docker image") {
	           steps {
		            script {
		                sh 'docker build -t lolspider/hello-docker-world:"$tagversion" .'
   	            }
            }
        }
	       stage("push docker image") {
	           steps {
		            script {
		                // sh 'docker push lolspider/hello-docker-world:"$tagversion"'
                    echo 'push lolspider/hello-docker-world:"tagversion"'
                }
            }
        }
        stage("git clone ansible playbook") {
              steps {
                    git credentialsId: '5fbf29ca-18b1-462c-87c8-ec8f88a4788e', url: 'https://github.com/lolspider/ansible-shop.git'
           }
       }
    }
}
