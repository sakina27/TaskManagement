pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'saki2726/calculator'
        GITHUB_REPO_URL = 'https://github.com/sakina27/Scientific-Calculator.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${GITHUB_REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("saki2726/calculator")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'DockerHubCred') {
                        sh 'docker tag calculator saki2726/calculator:latest'
                        sh 'docker push saki2726/calculator:latest'
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
