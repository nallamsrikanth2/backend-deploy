pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        // Timeout counter starts BEFORE agent is allocated
        timeout(time: 1, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
     parameters {
        string(name: 'appversion', defaultValue: '1.0.0', description: 'What is the application version')
    }
    stages {
        stage('print the information') {
            steps {
                script {
                    echo "application version: ${params.appversion}"
                    }
            }
        }
    
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            cleanWs()
        }
        success {
            echo "I will run when pipeline is sucess"
        }
        failure {
            echo " i will when pipeline is failure"
        }
    }
}