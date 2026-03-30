#!/bin/bash

echo "===== AWS AUTOMATION ====="

# List EC2 instances
echo "EC2 Instances:"
aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId"

# List S3 buckets
echo "S3 Buckets:"
aws s3 ls

# Create new S3 bucket (change name)
BUCKET_NAME="my-devops-bucket-12345"
aws s3 mb s3://$BUCKET_NAME

# Upload file to S3
aws s3 cp basics.sh s3://$BUCKET_NAME/

echo "Upload complete"