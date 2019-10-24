oc login -u admin -p openshift-demo


oc new-project Pipeline \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Test "


oc project Pipeline


oc new-app -f sonar/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=6.7




oc new-app -f selenium/selenium-hub.yaml

oc new-app -f selenium/selenium-node-chrome.yaml
oc new-app -f selenium/selenium-node-firefox.yaml


 

oc new-app  wildfly~https://github.com/openshiftdemos/os-sample-java-web.git    --name=testing-pipeline
oc expose svc/testing-pipeline


oc new-app jenkins
oc expose svc/jenkins



oc new-app -e \
    POSTGRESQL_USER=admin,POSTGRESQL_PASSWORD=admin,POSTGRESQL_DATABASE=database1 \
    registry.access.redhat.com/rhscl/postgresql-94-rhel7 --name=postgresql

oc expose svc/postgresql


