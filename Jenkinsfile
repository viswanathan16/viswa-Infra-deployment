pipeline {
    agent any
    
    environment {
        ENV = "${env.BRANCH_NAME}"
        TF_WORKDIR = "environments/${env.BRANCH_NAME}"
    }
    stages {
        stage ('Checkout') {
            steps {
                git branch : "${env.BRANCH_NAME}", url: 'https://github.com/viswanathan16/viswa-Infra-deployment.git'
            }
        }
        stage ('Terraform Init') {
            steps {
                dir ("${TF_WORKDIR}") {
                    sh 'terraform init -migrate-state'
                }
            }
        }
        stage ('Terraform Plan') {
            steps {
                dir ("${TF_WORKDIR}") {
                sh 'terraform plan -out=tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
                sh 'cat tfplan.txt'
                }
            }
        }
         
        stage ('Terraform approval') {
             when {
                expression {env.BRANCH_NAME == 'production'}
            }
            
            steps {
                input message: "approve the deployment to production?" , ok: 'Deploy'
            }
        }
      
        stage ('terraform apply') {
            steps {
                dir ("${TF_WORKDIR}") {
                    sh 'terraform apply tfplan'
                }
            }
        }
    }
}