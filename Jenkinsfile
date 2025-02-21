pipeline{
    agent any
    tools{
        maven 'myMaven'
    }
    stages{
        stage('Build Maven'){
            steps{
              checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KhadkaBibek/devops-automation.git']])
              sh 'mvn clean install'
            }
        }
        stage('Build a docker image from docker file')
        {
            steps{
                script{
                    sh 'docker build -t khadkabibek4/devops-integration-final .'
                }
            }
        }
        stage('Push docker image into docker hub?'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'password', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u khadkabibek4 -p ${dockerhubpwd}'
}
                sh 'docker push khadkabibek4/devops-integration-final'
                
                }
            }
        }
    }
}