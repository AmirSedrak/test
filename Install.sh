oc login -u admin -p openshift-demo


oc new-project ci-cd-test2 \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Test "


oc project ci-cd-test2


oc new-app -f sonar/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=6.7




oc create -f selenium/selenium-hub.yaml

oc create -f selenium/selenium-node-chrome.yaml
oc create -f selenium/selenium-node-firefox.yaml




oc new-app --name=testing-pipeline wildfly~https://github.com/openshiftdemos/os-sample-java-web.git
oc expose svc/testing-pipeline


oc new-app jenkins
oc expose svc/jenkins




