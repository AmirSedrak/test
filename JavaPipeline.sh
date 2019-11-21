oc new-project javapipeline \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Java Pipeline "
                
                
oc project javapipeline



oc new-app -f sonar/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=7.0

oc new-app -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password jboss/keycloak
oc expose svc/keycloak


oc new-app -f selenium/selenium-hub.yaml

oc new-app -f selenium/selenium-node-chrome.yaml
oc new-app -f selenium/selenium-node-firefox.yaml


 

oc new-app  wildfly~https://github.com/openshiftdemos/os-sample-java-web.git    --name=wildfly
oc expose svc/wildfly


oc new-app -e \
    POSTGRESQL_USER=admin,POSTGRESQL_PASSWORD=admin,POSTGRESQL_DATABASE=database1 \
     --template=openshift/postgresql-persistent --name=postgresql

oc expose svc/postgresql



oc new-app jenkins-persistent \
  -e INSTALL_PLUGINS=artifactory \
  -p ENABLE_OAUTH=true \
  -p JENKINS_IMAGE_STREAM_TAG=jenkins:latest \
  -p JENKINS_SERVICE_NAME=jenkins-persistent \
  -p JNLP_SERVICE_NAME=jenkins-persistent-jnlp \
  -p VOLUME_CAPACITY=10Gi
  
  
oc new-app docker.bintray.io/jfrog/artifactory-oss:latest

oc expose svc/artifactory-oss

oc new-app tomcat 

oc expose svc/tomcat


oc create -f Jenkins/BuildConfigHook.yaml

oc create -f Jenkins/Artifactory/ArtifactoryBC.yaml


# oc start-build ci-cd-java-pipeline
# oc start-build artifactory
