pipeline {
    agent any

    stages {
        stage("gradle build") {
            steps {
                script {
                    sh './gradlew build'
                }
            }
        }
	       stage("build and push docker image") {
            steps {
	        withDockerRegistry([credentialsId: '5fbf29ca-18b1-462c-87c8-ec8f88a4788e', url: 'https://github.com/lolspider/hello-docker-world.git']) {
	           sh "docker build -t lolspider/hello-docker-world:${env.BUILD_ID} ."
                   sh "docker push lolspider/hello-docker-world:${env.BUILD_ID}"
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
		withCredentials([file(credentialsId: 'git-crypt', variable: 'git_crypt')]) {
                    sh 'git-crypt unlock "$git_crypt"'
                    sh "sudo chmod 600 ssh_keys/*"
                    sh "ansible-playbook -i stage/hosts --extra-vars 'BUILD_ID=${env.BUILD_ID}' -u vagrant -b $playbook"
		}
            }
        }
    }
}
