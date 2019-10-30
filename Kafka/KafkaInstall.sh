



oc new-project myproject  --description="This is an example project to demonstrate KAFKA on OpenShift " --display-name="KAFKA"



oc apply -f strimzi-cluster-operator.yaml -n myproject

oc apply -f kafka.yml -n myproject




oc wait kafka/my-cluster --for=condition=Ready --timeout=300s -n myproject

