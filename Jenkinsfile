void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/my-org/my-repo"],
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
    stages{
        stage("check version"){
             steps{
                 container("ruby"){
                  setBuildStatus("Build starts", "PENDING")
                  sh 'ruby --version'
                 }
            }
        }


            stage("Test"){
                steps{
                    container("ruby"){
                    sh 'pwd'
                    sh 'ls'
                    sh 'bundle exec rspec spec'
                    sh 'COVERALLS_REPO_TOKEN=FGUCgJjKny6IGgK1i8LLXHFGop7GZklhb bundle exec coveralls push'


                    }
                }
                
                

            }
    }
}
