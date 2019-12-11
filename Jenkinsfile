node {
    def app
    /*test comment 1 */
    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("camwalk/coursework")
    }

    stage('Sonarqube') {
        environment {
        scannerHome = tool 'SonarQubeScanner'
    }
        withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
        timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com/library/camwalk', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
