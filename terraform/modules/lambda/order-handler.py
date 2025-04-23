import json
import boto3
import uuid
import os
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
sqs = boto3.client('sqs')

# Environment variables
TABLE_NAME = os.environ['TABLE_NAME']
QUEUE_URL = os.environ['QUEUE_URL']

def lambda_handler(event, context):
    try:
        body = json.loads(event['body'])

        order_id = str(uuid.uuid4())
        order = {
            'order_id': order_id,
            'customer_name': body['customer_name'],
            'item': body['item'],
            'quantity': int(body['quantity']),
            'timestamp': datetime.utcnow().isoformat()
        }

        # Save to DynamoDB
        table = dynamodb.Table(TABLE_NAME)
        table.put_item(Item=order)

        # Send to SQS
        sqs.send_message(
            QueueUrl=QUEUE_URL,
            MessageBody=json.dumps(order)
        )

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Order processed!', 'order_id': order_id})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
