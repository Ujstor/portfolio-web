pipeline {
  agent any

  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/Ujstor/portfolio_web/', branch: 'jenkins')
      }
    }

    stage('Prepair enviroment') {
      steps {
        script {
          sh "cp -f /home/portfolio/.env ${WORKSPACE}"
        }
      }
    }

    stage('Start Flask App') {
            steps {
                script {
                    sh 'gunicorn main:app --bind=0.0.0.0:5000 &'
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

    stage('Build') {
      steps {
        script {
          sh 'docker build -t ujstor/portfolio_web .'
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          sh 'docker push ujstor/portfolio_web'
        }
      }
    }
  }
}