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
		                sh 'docker push lolspider/hello-docker-world:"$tagversion"'
                }
            }
        }
        stage("git clone ansible playbook") {
            steps {
                    git credentialsId: '5fbf29ca-18b1-462c-87c8-ec8f88a4788e', url: 'https://github.com/lolspider/ansible-shop.git'
            }
        }
        stage("deploy the project and check if can be access") {
            steps {
                script {
                    sh 'git-crypt unlock /var/lib/jenkins/gpgkey'
                    sh 'sudo chmod 600 ssh_keys/*'
                    sh 'ansible-playbook -i $inventory --extra-vars "tagversion=$tagversion" -u vagrant -b $playbook'
                }
            }
        }
    }
}
