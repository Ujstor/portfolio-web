pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git(url: 'https://github.com/Ujstor/portfolio_web/', branch: 'flask_server')
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