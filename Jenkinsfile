node{
    def app
    stage ('Clone Git') {
        checkout scm
    }

    stage ('Build Image') {
        app = docker.build("nelrajan/test")
    }

    stage ('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage ('Push Image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
        app.push("${env.BUILD_NUMBER}")
        }
    }
}
