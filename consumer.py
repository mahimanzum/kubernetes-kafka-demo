from kafka import KafkaConsumer
import json
import threading
import time
from kafka import KafkaAdminClient
from kafka.admin.new_partitions import NewPartitions

client = KafkaAdminClient(bootstrap_servers='kafka:9092')
try:
    rsp = client.create_partitions({
        'test-topic': NewPartitions(4)
    })
    print(rsp)
except Exception as e:
    pass

consumer_id=2
consumer = KafkaConsumer('test-topic',
                        bootstrap_servers=['kafka:9092'],
                        group_id='same-group',
                        auto_offset_reset='earliest',
                        value_deserializer=lambda x: json.loads(x.decode('utf-8')))

for msg in consumer:
    print("consumed: ", "topic ", msg.topic, "partition:", msg.partition, msg.offset,
                  msg.key,"value:",  msg.value, msg.timestamp)
    time.sleep(2)