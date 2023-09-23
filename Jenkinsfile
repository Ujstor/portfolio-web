pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/flask_server']], userRemoteConfigs: [[url: 'https://github.com/Ujstor/portfolio_web/']]])
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'docker build -t ujstor/portfolio_web .'
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    sh 'docker push ujstor/portfolio_web'
                }
            }
        }
    }
}