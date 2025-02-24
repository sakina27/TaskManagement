pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'calculator'
        GITHUB_REPO_URL = 'https://github.com/sakina27/Scientific-Calculator.git'
        DOCKER_HUB_USER = 'saki2726'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: GITHUB_REPO_URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_HUB_USER}/${DOCKER_IMAGE_NAME}", '.')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'DockerHubCred') { // Make sure 'DockerHubCred' exists in Jenkins Credentials
                        sh "docker tag ${DOCKER_IMAGE_NAME} ${DOCKER_HUB_USER}/${DOCKER_IMAGE_NAME}:latest"
                        sh "docker push ${DOCKER_HUB_USER}/${DOCKER_IMAGE_NAME}"
                    }
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    ansiblePlaybook(
                        playbook: 'deploy.yml',
                        inventory: 'inventory'
                    )
                }
            }
        }
    }
}

