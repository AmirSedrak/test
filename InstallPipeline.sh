#!/bin/bash

oc login -u admin -p admin


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

oc new-app -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password jboss/keycloak
oc expose svc/keycloak

#oc new-app -e OPENSHIFT_ENABLE_OAUTH=true -e VOLUME_CAPACITY=10Gi jenkins-persistent

oc new-app --strategy=docker . --name=jenkins


oc new-app docker.bintray.io/jfrog/artifactory-oss:latest

oc expose svc/artifactory-oss


oc create -f Jenkins/BuildConfigHook.yaml


oc start-build ci-cd-java-pipeline


oc create -f Jenkins/Node.yml

oc start-build ci-cd-node-pipeline

oc new-app tomcat 

oc expose svc/tomcat

oc new-app nodejs~https://github.com/openshift/nodejs-ex.git --name=nodejs

oc expose svc/nodejs


#oc create -f Jenkins/Pipeline.yml

#oc start-build ci-cd-pipeline
