pipeline {
    agent any

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    parameters {
        booleanParam(
            name: 'RUN_TESTS',
            defaultValue: true,
            description: 'Run unit tests stage'
        )
        choice(
            name: 'TARGET_ENV',
            choices: ['dev', 'staging', 'prod'],
            description: 'Environment this build is targeting'
        )
    }

    environment {
        APP_NAME = 'jenkins-first'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out source code from SCM"
                checkout scm
            }
        }

        stage('Prepare') {
            steps {
                echo "Preparing workspace"
                sh 'ls -R'
                sh 'chmod +x *.sh'
            }
        }

        stage('Build') {
            steps {
                echo "Running build for ${env.APP_NAME}"
                sh './build.sh'
            }
        }

        stage('Quality checks') {
            parallel {
                stage('Lint') {
                    steps {
                        echo "Running lint"
                        sh './lint.sh'
                    }
                }
                stage('Unit tests') {
                    when {
                        expression { return params.RUN_TESTS }
                    }
                    steps {
                        echo "Running unit tests"
                        sh './unit_tests.sh'
                    }
                    post {
                        always {
                            junit 'reports/junit.xml'
                        }
                    }
                }
            }
        }

        stage('Package') {
            steps {
                echo "Packaging artifacts for ${params.TARGET_ENV}"
                sh './package.sh'
            }
        }
    }

    post {
        success {
            echo "Build ${env.BUILD_NUMBER} for ${env.APP_NAME} targeting ${params.TARGET_ENV} completed successfully"
            archiveArtifacts artifacts: 'artifacts/**', fingerprint: true
        }
        failure {
            echo "Build ${env.BUILD_NUMBER} failed. Check logs."
        }
        always {
            echo "Pipeline finished with status: ${currentBuild.currentResult}"
        }
    }
}
