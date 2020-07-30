void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/gogotech-benlin/sample_rails_app"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}
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
  options {
      skipDefaultCheckout(true)
  }
    stages{
        stage("check version"){
             steps{
                 container("ruby"){
                  sh 'ruby --version'

                 }
            }
        }
        stage("checkout scm")
        {
            steps{
                container("ruby"){
                    checkout scm

                }
            }
        }

            stage("Test"){
                steps{
                    container("ruby"){
                    sh 'pwd'
                    sh 'ls'
                    sh 'CODECOV_TOKEN=883a0ea2-d383-499e-ab19-16fe9eb9411fi bundle exec rspec spec'





                    }
                }
                
                

            }
    }
}
