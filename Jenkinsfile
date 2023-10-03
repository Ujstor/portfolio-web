pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git(url: 'https://github.com/Ujstor/portfolio_web/', branch: 'flask_server')
                  }

              }

        }

        stage('Create flask test app') {
        steps {
            script {
                sh "docker compose -f docker-compose-dev.yml up -d"
                }
            }
        }

        stage('Check flask app') {
        steps {
            script {
                sh "sleep 10 && curl http://localhost:5000"
                }
            }
        }

        stage('Test') {
        steps {
            script {
                sh "${JENKINS_HOME}/scripts/pytest.sh ${WORKSPACE}"
                }
            }
        }

        stage('Clean env') {
        steps {
            script {
                sh "docker compose -f docker-compose-dev.yml down"
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
