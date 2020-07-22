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
            image: ruby:2.5.1
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
 //        stage("Clone"){
 //            steps{
 //            checkout scm
 //            }
 //        }

        stage("requirement"){
            steps{
                 container("ruby"){

                sh 'gem install bundler'
                  sh 'bundle install'
                  sh 'bundle exec rake db:migrate'
 
                
            }
        }}

            stage("Test"){
                steps{
                 echo 'COVERALLS_REPO_TOKEN=FGUCgJjKny6IGgK1i8LLXHFGop7GZklhb bundle exec coveralls push'
                }
                
                

            }
    }
}
