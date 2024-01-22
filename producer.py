from kafka import KafkaProducer
import json
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
producer = KafkaProducer(bootstrap_servers=['kafka:9092'],
                         value_serializer=lambda v: json.dumps(v).encode('utf-8'))
i = 1
while True:
    message = {'number': i}
    producer.send('test-topic', value=message)
    print(f"Produced: {message}")
    i+=1
    time.sleep(1)
    

