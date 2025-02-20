pipeline {
    agent any
    tools {
        maven 'myMaven'
    }
    stages {
        stage('Checkout & Build Maven Project') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/KhadkaBibek/devops-automation.git']]])
                sh 'mvn clean install'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t khadkabibek4/devops-integration-final .'
                }
            }
        }
        
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'password', variable: 'password')]) {
                        sh 'echo $password | docker login -u khadkabibek4 --password-stdin'
                        sh 'docker push khadkabibek4/devops-integration-final'
                    }
                }
            }
        }
    }
}
