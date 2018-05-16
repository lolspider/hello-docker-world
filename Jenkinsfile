pipeline {
    agent any
    stages {
        stage("gradle build") {
            steps {
                script {
                    sh './gradlew build
                }
            }
        }
	stage("build image") {
	    steps {
		script {
		    sh 'docker build -t lolspider/hello-docker-world:"$tagversion" .'
   	        }
            }
        }
	stage("push image") {
	    steps {
		script {
		    sh 'docker push lolspider/hello-docker-world:"$tagversion"'
                }
            }
        }
    }
}
