pipeline {
         agent any
         stages { 
         	stage('Unit Test') {
                	steps {
                        	echo "Running the unit test..."
                        }
                }
                stage('Integration test') {
                	agent {
                        	docker {
                                	reuseNode true
                                        image 'coursework'
                                }
                        }
                        steps {
                        	echo "Running the integration test..."
                        }
                }
	}
}
