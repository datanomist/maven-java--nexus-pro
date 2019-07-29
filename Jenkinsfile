node {
   def jdkHome
   def mvnHome
  stage('Checkout') { // for display purposes
      checkout scm
   }
   stages
   stage('build') {
      steps {
         sh 'mvn clean package'
      }
   }
}
   
