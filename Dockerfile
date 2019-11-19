FROM quay.io/openshift/origin-jenkins:v4.0


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


COPY plugins.txt /opt/openshift/configuration

RUN /usr/local/bin/install-plugins.sh /opt/openshift/configuration/plugins.txt