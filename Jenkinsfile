node {
   def jdkHome
   def mvnHome
   
   stage('Checkout') { // for display purposes
      checkout scm
   }
   stage('Build') {
      echo 'Build is completed successfully'
      echo "artifactId : ${ArtifactName}"
      echo "Version : ${Version}"
        sh 'mvn -version'
      try{
      sh 'mvn clean package'
        currentBuild.result = 'SUCCESS'
        catch(e){
      currentBuild.result = 'FAILURE
            }
         finally {
               emailNotification() 
            }
            def emailNotification() {
   emailext (
      to: 'haridasuvenkatesh@gmail.com',
      subject: "Status of pipeline: ${currentBuild.fullDisplayName}",
      body: "${BUILD_URL} has result ${currentBuild.currentResult}"
     )
            }
      }
