node {
    def app
    /*test comment */
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("camwalk/coursework")
    }

    stage('Sonarqube') {
        script {
        scannerHome = tool 'SonarQubeScanner'
    }
        withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com/library/camwalk', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
