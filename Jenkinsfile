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
          - name: java
            image: maven
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
                    sh 'bundle exec rspec spec'





                    }
                }
                
                

            }
            stage("sonarqube"){
                steps{
                    container("java"){
                          script {
                               scannerHome = tool 'sonarqube-scanner'
                          }
                          withSonarQubeEnv('sonarcloud') { // If you have configured more than one global server connection, you can specify its name
                              sh "${scannerHome}/bin/sonar-scanner " +
                                 "-Dsonar.pullrequest.branch=${env.BRANCH_NAME} " +
                                 "-Dsonar.pullrequest.key=${env.CHANGE_ID} "  +
                                 "-Dsonar.pullrequest.provider=github " +
                                 "-Dsonar.projectKey=gogotech-benlin_sample_rails_app " +
                                 "-Dsonar.organization=gogotech-benlin"
                          }
                    }
                }
            }


    }
}
