pipeline {
    agent any
    def app
    stages {
        stage ('Checkout from Git') {
            steps {
                checkout scm     
            }
        }
        
        stage ('Build image') {
            steps {
                app = docker.build("nelrajan/test")
            }
        }
        
        stage ('Test image') {
            steps {
                app.inside {
                   sh 'echo "Test passed"'
                }           
            }
        }
        
        stage ('Push image') {
            steps {
                docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                    
                    app.push("${env.BUILD_NUMBER}")
                }
            }
                
        }
    }
}
