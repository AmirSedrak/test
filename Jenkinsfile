def mvnCmd = "mvn"

pipeline {
  agent {
      node {
        label 'maven'
      }    
    }
  stages {
    stage('Pull App') {
      steps {
        git branch: 'master', url: 'https://github.com/javaparser/javaparser-maven-sample.git' 
      }
    }
  
       stage('build maven') {
      steps {
        script {
          sh "${mvnCmd} clean install"
        }
      }  
    }
    
    
      stage('checking node version') {
      steps {
        script {
          sh "node --version"
        }
      }  
    }


    
  
     stage('Code Analysis') {
      steps {
        script {
          sh "${mvnCmd} sonar:sonar  \
            -Dsonar.projectKey='java-backend' \
            -Dsonar.projectName='java-backend' \
            -Dsonar.sources=. \
            -Dsonar.host.url='http://sonarqube.pipeline.svc:9000' \
            -Dsonar.login='admin' \
            -Dsonar.password='admin'"
        }
      }
    }
    
    stage('Build on WildFly') {
      steps {
        script{
            openshiftDeploy apiURL: '', authToken: '', depCfg: 'wildfly', namespace: 'pipeline', verbose: 'false', waitTime: '', waitUnit: 'sec'
        }
      }
    }
    
    stage('Deploy to WildFly') {
      steps {
        script{
            openshiftDeploy apiURL: '', authToken: '', depCfg: 'wildfly', namespace: 'pipeline', verbose: 'false', waitTime: '', waitUnit: 'sec'
        }
      }
    }  
    
    

    
    
  }
}
