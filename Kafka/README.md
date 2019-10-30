

## How to Run

Once the cluster is running, you can run a simple producer to send messages to Kafka topic (the topic will be automatically created):

```elm
oc -n myproject run kafka-producer -ti --image=strimzi/kafka:0.14.0-kafka-2.3.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list my-cluster-kafka-bootstrap:9092 --topic my-topic

```


And to receive them in a different terminal you can run:

```elm
oc -n myproject run kafka-consumer -ti --image=strimzi/kafka:0.14.0-kafka-2.3.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic my-topic --from-beginning

```
