oc new-project nodepipeline \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Node Pipeline "


oc project nodepipeline


oc new-app -f sonar/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=7.0




oc new-app -f selenium/selenium-hub.yaml

oc new-app -f selenium/selenium-node-chrome.yaml
oc new-app -f selenium/selenium-node-firefox.yaml



 oc new-app -e \
    POSTGRESQL_USER=admin,POSTGRESQL_PASSWORD=admin,POSTGRESQL_DATABASE=database1 \
    --template=openshift/postgresql-persistent --name=postgresql

 oc expose svc/postgresql




oc new-app -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password jboss/keycloak
oc expose svc/keycloak


oc create -f Jenkins/Angular-Jenkins.yml


oc new-app nodejs~https://github.com/openshift/nodejs-ex.git --name=nodejs

oc expose svc/nodejs


# oc start-build ci-cd-nodejs-pipeline 

