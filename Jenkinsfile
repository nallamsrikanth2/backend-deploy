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
       stage('Terraform Init and plan') {
            steps {
                sh '''
                for dir in terraform/01-vpc terraform/02-sg terraform/04-db terraform/05-vpn terraform/06-app_alb
                do
                    echo "Running: $dir"
                    cd $dir
                    terraform init -reconfigure
                    terraform plan -var="app-version=${params.appversion}"
                    cd ../..
                done
                '''
    }
}
        //  stage('deploy') {
        //     steps {
        //         sh """
        //             cd terraform
        //             terraform apply -auto-approve -var="app-version=${params.appversion}"
        //         """
        //     }
        // }
    
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