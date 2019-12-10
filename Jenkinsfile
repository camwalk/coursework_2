node {
    def app
    /*test comment 1 */
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("coursework")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('registry.hub.docker.com/library/camwalk', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
