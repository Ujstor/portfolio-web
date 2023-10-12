pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'ujstor'
        DOCKER_REPO_NAME = 'portfolio_web'
        VERSION_PART = 'Patch' // Patch, Minor, Major
        TAG = ''
    }

    stages {
        stage('Checkout Code') {
            steps {
                git(url: 'https://github.com/Ujstor/portfolio_web/', branch: env.BRANCH_NAME)
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

        stage('Generate Docker Image Tag') {
            when {
                expression { env.BRANCH_NAME == 'flask_server' }
            }
            steps {
                script {
                    TAG = sh(script: "/var/lib/jenkins/scripts/docker_tag.sh $DOCKER_HUB_USERNAME $DOCKER_REPO_NAME $VERSION_PART", returnStdout: true).trim()

                    if (TAG) {
                        echo "Docker image tag generated successfully: $TAG"
                    } else {
                        error "Failed to generate Docker image tag"
                    }

                    env.TAG = TAG
                }
            }
        }

        stage('Build') {
            when {
                expression { env.BRANCH_NAME == 'flask_server' }
            }
            steps {
                script {
                    sh "docker build --no-cache -t ${DOCKER_HUB_USERNAME}/${DOCKER_REPO_NAME}:${TAG} ."
                }
            }
        }

        stage('Deploy') {
            when {
                expression { env.BRANCH_NAME == 'flask_server' }
            }
            steps {
                script {
                    sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_REPO_NAME}:${TAG}"
                }
            }
        }

        stage('Environment Cleanup') {
            when {
                expression { env.BRANCH_NAME == 'flask_server' }
            }
            steps {
                script {
                    sh "docker rmi ${DOCKER_HUB_USERNAME}/${DOCKER_REPO_NAME}:${TAG}"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully"
        }
    }
}