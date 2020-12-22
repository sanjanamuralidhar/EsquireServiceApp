pipeline {
  agent any
  stages {
    stage('checking current workspace') {
      steps {
        sh 'pwd'
      }
    }

    stage('change api') {
      steps {
        sh 'sed -i \'s+34.68.14.183+34.75.39.132+g\' $PWD/openapi/lib/api.dart'
      }
    }

    stage('build apk') {
      steps {
        sh 'flutter build apk'
        sh 'sudo cp -f $PWD/build/app/outputs/apk/release/app-release.apk /home/jenkins/serviceexecutive-app'
      }
    }

    stage('start web server') {
      parallel {
        stage('start web server') {
          steps {
            sh 'flutter run -d web-server --web-hostname 10.142.0.2 --web-port 8087'
          }
        }

        stage('stop previous server') {
          steps {
            sh 'sudo kill -9 `sudo lsof -t -i :8087`'
          }
        }

      }
    }

  }
}