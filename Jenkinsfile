pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /var/jenkins_home/maven-docker:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                echo 'Jenkins YeZhiyue'
                sh 'pwd'
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}