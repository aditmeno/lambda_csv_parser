import os
import csv
import json
import boto3
import urllib

s3 = boto3.client("s3")
dynamodbdb = boto3.client("dynamodb", region_name=os.environ.get("AWS_REGION"))

def handler(event, context):
    statusCode = 200
    statusMessage = "Successfully inserted data"
    bucket = event["Records"][0]["s3"]["bucket"]["name"]
    key = urllib.parse.unquote_plus(event["Records"][0]["s3"]["object"]["key"], encoding="utf-8")
    try:
        # Fetch the data from uploaded file
        csvFile = s3.get_object(Bucket=bucket, Key=key)
        dataSet = csvFile["Body"].read().decode("utf-8").split("\n")
        csvReader = csv.reader(dataSet, delimiter=",")

        next(csvReader, None)
        for row in csvReader:
            print(f"{row[0]}, {row[1]}, {row[2]}")
            response=dynamodbdb.put_item(TableName=os.environ.get("DYNAMODB_TABLE"),
                Item={
                    "deviceID": {
                        "N": str(row[0])
                    },
                    "deviceName": {
                        "S": str(row[1])
                    },
                    "Status": {
                        "S": str(row[2])
                    }
                })
            print(response)
    except Exception as e:
        print(str(e))
        statusCode = 500
        statusMessage = f"Error occured parsing file {bucket}/{key}"

    return {
        'statusCode': statusCode,
        'body': json.dumps(statusMessage)
    }
