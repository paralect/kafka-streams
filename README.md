## Kafka stream starter pack

This repo contain a simple example of Kafka streams. To start you need to have `docker` and `docker-compose`. Provide the command below to start.

```console
$ docker-compose up -d
```

After a few seconds you should see 4 docker containers up and running. Zookeeper and Kafka are core dependencies. Meetups container has entrypoint which create needed topics and start to populate topic 
with data from http://stream.meetup.com/. Stream container create a stream application which 
listen to events and simple mirror incoming data to another topic.


See the data in topic:
```console
$ kafka-console-consumer --bootstrap-server localhost:29092 --topic meetups-mirror
```

### Useful links:
* https://github.com/confluentinc/kafka-streams-examples#examples-apps
* https://kafka.apache.org/23/documentation/streams/architecture