cat > Jenkinsfile << 'EOF'
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source code'
            }
        }

        stage('Build') {
            steps {
                echo 'Running build.sh'
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests (none yet)'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
EOF
