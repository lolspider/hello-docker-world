pipeline {
    agent any
    stages {
        stage("push image") {
            steps {
                script {
                    sh './gradlew build docker'
                    sh ‘docker tag lolspider/hello-docker-world lolspider/hello-docker-world:"$tagversion"’
                    sh 'docker push lolspider/hello-docker-world:"$tagversion"'
                }
            }
        }
    }
}
