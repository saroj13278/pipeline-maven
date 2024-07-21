pipeline {
    agent any
    environment {
           PASS=credentials('registry_pass')
      
        }

    stages {
        stage('Build') {
            steps {
                sh '''
                   ./jenkins/build/maven.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                    '''
            }
                 post {
                always {
                    // Print the contents of the java-app and target directories for debugging
                    sh 'ls -la /var/lib/jenkins/workspace/maven-app/java-app'
                    sh 'ls -la /var/lib/jenkins/workspace/maven-app/java-app/target'
                }
            }
     
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }
        }
        stage('push') {
            steps {
             sh './jenkins/push/push.sh'
            }
        }
       stage("deploy"){
          steps {
              sh './jenkins/deploy/deploy.sh'
           }
    }
}

}
