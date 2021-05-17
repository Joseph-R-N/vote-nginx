pipeline {
    agent any
    stages {
        stage ('Checkout from Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/Joseph-R-N/simple-java-maven-app.git']]])     
            }
        }
        
        stage ('Compile') {
            steps {
                sh 'mvn compile'
            }
        }
        
        stage ('Build') {
            steps {
                sh 'mvn install'
            }
        }
        
        stage ('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage ('Publish Test Result') {
            steps {
                junit '**/*.xml'
            }
        }
        
        stage ('Artifact') {
            steps {
                archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
            }
        }
          
        stage ('Mail') {
            steps {
                emailext attachLog: true, body: '''Please go to ${BUILD_URL} and verify the build.
                The Build Number (${BUILD_NUMBER}) status is ${BUILD_STATUS}''', replyTo: 'noreply@gmail.com', subject: 'Job \'${JOB_NAME}\' (${BUILD_NUMBER}) the Build is ${BUILD_STATUS}', to: 'nel.rajan@gmail.com'
            }
                
        }
    }
}
