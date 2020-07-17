# Writing a Kafka Consumer
Now that we are populating Kafka with our weather data, we need a consumer to
read it. In this exercise we will develop a simple service. In real life,
such a service would process the data for a particular use case. For example
we might want to transform and normalise the data, look for certain data
and/or store in a database, maybe one backing a website showing a weather map.

## The Boilerplate
In `src`, create a file called `consumer.py` and add the following
 code:  

```python
"""Simple Kafka Consumer"""
import sys
from termcolor import colored


def process(consumer):
    while True:
        try:
            print('doing nothing')
        except KeyboardInterrupt:
            print(colored('Shutting Down', 'green'))
            return


def main():
    kafka_consumer = 'foo'
    process(kafka_consumer)
    return 0


if __name__ == '__main__':
    sys.exit(main())
```

As with the producer module we've imported some packages for a basic app.
We have a `process` function containing a loop that runs forever, until we
issue a `KeyboardInterrupt` from the command line (or an operating system
signal to the same effect).

## Make a Kafka consumer
Add the following to the top of `producer.py`: 

```python
from kafka import KafkaConsumer
```

The `process` function currently gets a consumer that is the string `foo`.
Let's give it a proper consumer object as follows:

```python
kafka_consumer = KafkaConsumer('kubertron.weather.inbound',
                               group_id='met-consumer-group',
                               auto_offset_reset='earliest',
                               bootstrap_servers=['localhost:29092'])
```

Here we have specified the following parameters:

- The topic we want to consume from (_kubertron.weather.inbound_).
- A consumer `group_id`. This tells the Kafka "coordinator" how to get data
  for us from various topic partitions. 
- The `auto_offset_reset` tells the client to initially consume from the
  earliest topic partition offset. 
- We are already familiar with the `bootstrap_servers` parameter that
  specifies a Kafka broker to connect with. 

## Consume messages 
We are now ready to consume messages. We are passing `kafka_consumer` to the
_process_ function. The consumer is an "iterable". Simply put, this means we
can treat it as if it was a _list_ of messages that "never empties". This is
because the default behaviour of the iterable is to "wait forever" for new
messages. 

To use the consumer in our process function, replace the line:

```python
print('doing nothing') 
```

with the following:

```python
for message in consumer:
    print(f'--- {message.topic} - '
          f'partition({message.partition})  '
          f'offset({message.offset}) ---'
          )
    print(colored(f'{message.value}', 'green'))
```

Here we are simply getting a message and printing some of the attributes the
message object provides. Importantly this includes the message `value` but
also includes the topic, partition and offset we consumed from.

## Running the code 
We are ready to execute our consumer app! In a terminal window, make sure you
are in the `kafka_demo` directory. Enter:

```bash
$ python -m src.consumer
```

You should see terminal output something like:

```bash
--- kubertron.weather.inbound - partition(5)  offset(0) ---
b'sunny and warm'
--- kubertron.weather.inbound - partition(6)  offset(0) ---
b'sunny and warm'
--- kubertron.weather.inbound - partition(4)  offset(0) ---
b'sunny and warm'
--- kubertron.weather.inbound - partition(1)  offset(0) ---
b'sunny and warm'
--- kubertron.weather.inbound - partition(1)  offset(1) ---
b'sunny and warm'
```

Excellent work, you've successfully consumed from Kafka! Enter `ctrl+c` to
terminate the app.

## The story so far
This is great progress! Hopefully you've got a `consumer.py` module that
looks a bit like this: 

```python
"""Simple Kafka Consumer"""
import sys
from kafka import KafkaConsumer
from termcolor import colored


def process(consumer):
    while True:
        try:
            for message in consumer:
                print(f'--- {message.topic} - '
                      f'partition({message.partition})  '
                      f'offset({message.offset}) ---'
                      )
                print(colored(f'{message.value}', 'green'))
        except KeyboardInterrupt:
            print(colored('Shutting Down', 'green'))
            return


def main():
    kafka_consumer = KafkaConsumer('kubertron.weather.inbound',
                                   group_id='met-consumer-group',
                                   auto_offset_reset='earliest',
                                   bootstrap_servers=['localhost:29092'])
    process(kafka_consumer)
    return 0


if __name__ == '__main__':
    sys.exit(main())
```

Here's a quick recap of what we have done so far:

- We wrote a Kafka consumer from scratch.
- We ran our consumer app.
- We saw consumed messages appear in our terminal window.
