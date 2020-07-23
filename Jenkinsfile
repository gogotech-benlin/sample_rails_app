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
    sh 'COVERALLS_REPO_TOKEN=FGUCgJjKny6IGgK1i8LLXHFGop7GZklhb bundle exec coveralls push'


                    }
                }
                
                

            }
    }
}
