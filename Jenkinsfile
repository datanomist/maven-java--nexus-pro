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
        stage ('Artifactory configuration') {
            // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
            server = Artifactory.server SERVER_ID = http://localhost:8081/artifactory/webapp/#/admin/repository/local/jenkins-integration/edit
            rtMaven = Artifactory.newMavenBuild()
            rtMaven.tool = MAVEN_TOOL // Tool name from Jenkins configuration
            rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
            rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
            rtMaven.deployer.deployArtifacts = false // Disable artifacts deployment during Maven run
            buildInfo = Artifactory.newBuildInfo()
        }
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml'
                    archive 'target/*.war'
                }
            }
        }
    }
}
