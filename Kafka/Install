



oc new-project myproject  --description="This is an example project to demonstrate KAFKA on OpenShift " --display-name="KAFKA"




oc apply -f strimzi-cluster-operator.yaml -n myproject

oc apply -f kafka.yml -n myproject



oc -n myproject run kafka-producer -ti --image=strimzi/kafka:0.14.0-kafka-2.3.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list my-cluster-kafka-bootstrap:9092 --topic my-topic


