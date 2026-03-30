#!/bin/bash

echo "===== AWS RESOURCE CREATION ====="

# Create S3 Bucket
BUCKET_NAME="devops-bucket-$(date +%s)"
echo "Creating S3 bucket: $BUCKET_NAME"
aws s3 mb s3://$BUCKET_NAME

# Launch EC2 instance
echo "Launching EC2 instance..."

INSTANCE_ID=$(aws ec2 run-instances \
  --image-id ami-0e670eb768a5fc3d4 \
  --count 1 \
  --instance-type t2.micro \
  --key-name jenkins \
  --security-group-ids sg-xxxxxxxx \
  --query "Instances[0].InstanceId" \
  --output text)

echo "EC2 Instance Created: $INSTANCE_ID"

# Wait for instance to start
echo "Waiting for instance to run..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Get Public IP
PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "EC2 Public IP: $PUBLIC_IP"