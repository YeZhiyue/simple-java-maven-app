pipeline {
    agent {
        node {
            label 'my-maven'
            customWorkspace '/var/jenkins_home/maven/apache-maven-3.6.3'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo '我的定时扫描策略 每次隔离一分钟'
                sh 'mvn -vesion'
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
        stage('Install') {
            steps {
                sh 'mvn install'
            }
        }
        stage('Deliver') {
            steps {
                sh 'pwd'
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
