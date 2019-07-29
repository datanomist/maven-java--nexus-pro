node {
   def jdkHome
   def mvnHome
  stage('Checkout') { // for display purposes
      checkout scm
   }
   steps {
      echo 'Hello, Maven'
      sh 'mvn --version'
   }
   stages
   stage('build') {
      steps {
         sh 'mvn clean package'
      }
   }
}
   
