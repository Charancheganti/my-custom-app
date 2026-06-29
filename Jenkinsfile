pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                // Jenkins automatically pulls your GitHub code into its workspace
                echo 'Pulling fresh code from GitHub...'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building new Docker image...'
                sh 'sudo docker build -t my-app .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Stopping old container and launching the new one...'
                // The '|| true' ensures the pipeline doesn't crash if the container isn't already running
                sh 'sudo docker stop my-running-app || true'
                sh 'sudo docker rm my-running-app || true'
                sh 'sudo docker run -d -p 80:80 --name my-running-app my-app'
            }
        }
    }
}
