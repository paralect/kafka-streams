#!/usr/bin/env bash

for topic in ${KAFKA_CREATE_TOPICS//,/ }; do
    kafka-topics.sh --create --topic ${topic} --replication-factor 1 \
        --if-not-exists --partitions 1 --zookeeper zookeeper:2181
done

echo "Producing messages in ${KAFKA_MEETUP_TOPIC} topic"

exec curl -s http://stream.meetup.com/2/rsvps | \
    kafka-console-producer.sh --broker-list ${KAFKA_HOST}:${KAFKA_PORT} --topic ${KAFKA_MEETUP_TOPIC}
