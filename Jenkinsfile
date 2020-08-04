pipeline{
  agent {
    kubernetes {
              yaml """
        apiVersion: v1
        kind: Pod
        metadata:
          labels:
            some-label: some-label-value
        spec:
          containers:
          - name: ruby
            image: gogotechhk/sample_rails_app 
            command:
            - cat
            tty: true
        """
    }
  }
    stages{
        stage("check version"){
             steps{
                 container("ruby"){
                  sh 'ruby --version'
                 }
            }
        }


            stage("Test"){
                steps{
                    container("ruby"){
                    sh 'bundle exec coveralls push'

                    }
                }
                
                

            }
            stage("sonarqube"){

           agent {     docker   'maven:3-alpine'   }


                steps{
                          script {
                               scannerHome = tool 'sonarqube-scanner'
                          }
                          withSonarQubeEnv('sonarcloud') { // If you have configured more than one global server connection, you can specify its name
                              sh "${scannerHome}/bin/sonar-scanner"
                          }
                }
            }


    }
}
