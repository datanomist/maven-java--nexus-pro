pipeline {
    agent any
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml'
                    archive 'target/*.war'
                    def server = Artifactory.newServer url:http://localhost:8081/artifactory, credentialsId:userName:admin;password:password
                    def rtMaven = Artifactory.newMavenBuild()
                    def buildInfo
                    }
                }
            }
        }
    }
