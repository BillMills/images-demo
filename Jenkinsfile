pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker image ls'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
