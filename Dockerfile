
stages {
  stage('Building image') {
    steps{
      script {
        docker.build registry + ":$BUILD_NUMBER"
        stage('Deploy Image') {
      }
    }
  }

stage('Deploy Image') {
  steps{
    script {
      docker.withRegistry( '', userName:awsdocker789,password:aws427400 ) {
        dockerImage.push()
      }
    }
  }
}
}

