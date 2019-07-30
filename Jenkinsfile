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
                    stage('sonarQube analysis') {
                        steps {
                            //prepare sonarQube scanner environment
                            withSonarQubeEnv('SonarQube6.3') {
                                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin3.3.0.603:sonar'
                            }
                        }
                    }
                }
            }
        }
    }
}
