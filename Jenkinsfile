pipeline{
    agent {
        docker{
            image 'ruby:2.5.1'
        }
    }
    stages{
        stage("Clone"){
            checkout scm
        }
            stage("build"){
                sh 'bundle install'
                sh 'bundle exec rake db:migrate'
            }

            stage("Test"){
                echo 'testing'

                

            }
    }
}
