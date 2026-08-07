pipeline {
    agent any

    environment {
        APP_NAME = 'bistro-web-app'
        CONTAINER_NAME = 'bistro-live-container'
    }

    stages {
        stage('1. Pull Code') {
            steps {
                echo '📥 Fetching latest code revision from GitHub...'
                git branch: 'main', url: 'https://github.com/Charancheganti/my-custom-app.git'
            }
        }

        stage('2. Code Verification & Test') {
            steps {
                echo '🧪 Executing pre-build automated tests...'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }

        stage('3. Build Docker Image') {
            steps {
                echo '🏗️ Compiling production Docker container image...'
                sh 'docker build -t $APP_NAME:latest .'
            }
        }

        stage('4. Deploy Live Container') {
            steps {
                echo '🚀 Executing rolling update on live application container...'
                sh 'docker stop $CONTAINER_NAME || true'
                sh 'docker rm $CONTAINER_NAME || true'
                sh 'docker run -d --name $CONTAINER_NAME -p 80:80 $APP_NAME:latest'
            }
        }

        stage('5. Automated Health Check') {
            steps {
                echo '🩺 Testing deployment endpoint health...'
                sleep 3
                sh 'curl -f http://localhost/health || exit 1'
                echo '✅ App is live and responding healthily on Port 80!'
            }
        }
    }

    post {
        success {
            echo '🎉 Pipeline completed successfully! Application is live.'
        }
        failure {
            echo '🚨 Pipeline execution failed. Please check stage console logs.'
        }
    }
}
