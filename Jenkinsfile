pipeline{
    agent {
        docker{
            image 'ruby:2.5.1'
        }
    }
    stages{
        stage("Clone"){
            steps{
            checkout scm
            }
        }
            stage("build"){
                steps{
                  sh 'bundle install'
                  sh 'bundle exec rake db:migrate'
                }
                
            }

            stage("Test"){
                steps{
                 echo 'testing'
                }
                
                

            }
    }
}
