oc login -u admin -p openshift-demo


oc new-project pipeline \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Pipeline "


oc project pipeline


oc new-app -f sonar/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=7.0




oc new-app -f selenium/selenium-hub.yaml

oc new-app -f selenium/selenium-node-chrome.yaml
oc new-app -f selenium/selenium-node-firefox.yaml


 

oc new-app  wildfly~https://github.com/openshiftdemos/os-sample-java-web.git    --name=testing-pipeline
oc expose svc/testing-pipeline




oc new-app -e \
    POSTGRESQL_USER=admin,POSTGRESQL_PASSWORD=admin,POSTGRESQL_DATABASE=database1 \
     --template=openshift/postgresql-persistent --name=postgresql

oc expose svc/postgresql


oc create -f Jenkins/Pipeline.yml

oc start-build ci-cd-pipeline
