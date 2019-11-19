FROM jenkins/jenkins:lts



MAINTAINER Amir Sedrak, Amir.Sedrak@ibm.com



USER root



RUN apt-get update && \
        apt-get install -y \
        nodejs \
        groff \
        git \
        curl \
        maven \
        postgresql \
        && apt-get clean

USER jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
        JENKINS_URL=https://jenkins-pipeline.apps.bnpdev.com\
        JENKINS_USER=admin \
        JENKINS_PASS=admin 

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
