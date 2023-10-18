pipeline {

    agent any

    stages {
        stage('Build Jar') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t=olekshuds/selenium:latest .'
            }
        }

        stage('Push Image') {
            environment {
                DOCKER_HUB = credentials('dockerhub-credentials')
            }
            steps {
                sh 'echo ${DOCKER_HUB_PSW} | docker login -u ${DOCKER_HUB_USR} --password-stdin'
                sh 'docker push olekshuds/selenium:latest'
                sh "docker tag olekshuds/selenium:latest olekshuds/selenium:${env.BUILD_NUMBER}"
                sh "docker push olekshuds/selenium:${env.BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}