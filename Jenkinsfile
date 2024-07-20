pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''
                   ./jenkins/build/maven.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                    '''
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
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
