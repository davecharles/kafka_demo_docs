# Next Steps

This was a great start, we hope you enjoyed it and feel that you have the
confidence to continue developing against kafka and exploring more of the
capabilities.

An obvious follow up activity would be to generate some realistic weather data
with message keys. The [Kafka 101](https://github.com/davecharles/kafka_demo)
repository has a `sim.py` module in the `src` package. Take a look and see if
 you can use it to simulate better weather stats.
 
This was just a practical introduction to getting started with Kafka. To use
Kafka in industrial scale environments there are many other topics (no pun
intended) to understand, some are detailed below.

## A distributed system 
Kafka is a distributed system, and as such, there is much to understand
about:

- Replication
- Consistency
- Availability

and how Kafka addresses these demands.

## Configurable client
Client API is simple but highly configurable. There's lots of flexibility and
to really and an understanding of the client architecture really helps
one to appreciate what the various client configurations are for.

## Topic Schemas 
Topics can have a schema to define the structure of the data format. Supported 
formats are Avro, Protobuf and JSON-Schema. 

Kafka provides a Schema Registry to support this as well as
serialiser/deserialiser plugins to support these formats. 

Related to topic schemata is schema evolution strategies. These are important
for using Kafka in real life with real consumers.

## Kafka Streams
Kafka provides a powerful stream-processing library that sits over the
Producer/Consumer API covered in these tutorials. Kafka stream processing
provides high-level operators like filter, map, grouping, windowing,
aggregation, joins, and the notion of tables.

## Summary
Thanks for playing with Kafka 101, please share with friends and colleagues.

> A book must be the axe for the frozen sea within us - Franz Kafka
