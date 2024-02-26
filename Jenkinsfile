/*
    Note: Windows users use "bat" instead of "sh"
    For ex: bat 'docker build -t=vthakur239/selenium .'

    Do not use "vthakur239" to push. Use your dockerhub account
*/
pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image'){
            steps{
                sh 'docker build -t=vthakur239/selenium .'
            }
        }

        stage('Push Image'){
            environment{
                // assuming you have stored the credentials with this name
                DOCKER_HUB = credentials('dockerCredsvthakur239')
            }
            steps{
                // There might be a warning.
                sh 'docker login -u ${DOCKER_HUB_USR} -p ${DOCKER_HUB_PSW}'
                sh 'docker push vthakur239/selenium'
            }
        }

    }

    post {
        always {
            sh 'docker logout'
        }
    }

}