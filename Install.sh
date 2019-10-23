oc login -u admin -p openshift-demo


oc new-project ci-cd-test2 \
            --description="This is an example project to demonstrate OpenShift CI/CD automation" \
                --display-name="CI/CD Test "


oc project ci-cd-test2


git clone https://github.com/AmirSedrak/test.git

cd test/sonar/

oc new-app -f sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=6.7

cd ..

cd selenium/


oc create -f selenium-hub.yaml

oc create -f selenium-node-chrome.yaml
oc create -f selenium-node-firefox.yaml

cd ..

cd wildfly/

oc new-app -f wildfly.yml


