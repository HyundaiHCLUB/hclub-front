pipeline {
    agent any

    stages {
       stage('CLONE')
        {
        steps{
           git branch : 'prod', credentialsId : 'git-token' ,url : 'https://github.com/HyndaiFinalProject/hclub-front.git'
            sh '''
            cd /var/jenkins_home/workspace/hclub-front 
            '''
        }
           
        }
        stage('PUT application.yml'){
            steps{
                sh '''
                cd /var/jenkins_home/workspace/hclub-front
                echo 'current dir ' ${PWD}
                cp /var/jenkins_home/config/application.yml /var/jenkins_home/workspace/hclub-front/src/main/resources
                '''
                
            }
        }
        
        stage('Docker Build')
        {
        steps{
           
            sh '''
           echo 'Build dir' ${PWD}
           cd /var/jenkins_home/workspace/hclub-front
           docker stop hclub-front || true
           docker rm hclub-front || true
           
           docker rmi popopododo/hclub-front || true
           
           docker build -t popopododo/hclub-front .
            '''
        }
           
        }
        
        stage('Docker Deploy')
        {
        steps{
           
            sh '''
           docker run --name hclub-front -d -p 8084:8080 popopododo/hclub-front
            '''
        }
           
        }
    }
     post {
                success {
                    discordSend description: "H-CLUB Front Build",
                                footer: "H-CLUB 프론트엔드 빌드 완료",
                                link: env.BUILD_URL, result: currentBuild.currentResult,
                                title: "H-CLUB 프론트엔드 빌드 Success",
                                webhookURL: env.WEBHOOK_URL
                }
                failure {
                    discordSend description: "H-CLUB Front Build",
                                footer: "H-CLUB 프론트엔드 빌드 실패",
                                link: env.BUILD_URL, result: currentBuild.currentResult,
                                title: "H-CLUB Front 빌드 Fail",
                                webhookURL: env.WEBHOOK_URL
                }
            }
   
}