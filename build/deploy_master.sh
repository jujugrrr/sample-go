#!/bin/bash
set -e
pip install awscli
# Copy the artifact to S3
aws s3 cp ${CIRCLE_ARTIFACTS}/sample-go s3://circleci-samplego/sample-go --acl 'public-read'
# Deploy to the servers
for host in `aws ec2 describe-instances --filters "Name=tag:app,Values=samplego" --query 'Reservations[0:].Instances[0].PublicIpAddress' --output text --region eu-west-1`
do 
  echo "Deploying code to $host"
  ssh -o StrictHostKeyChecking=no -t samplego@$host "mv sample-go sample-go-$CIRCLE_BUILD_NUM-`date --iso`"
  scp -o StrictHostKeyChecking=no ${CIRCLE_ARTIFACTS}/sample-go samplego@$host:sample-go
  ssh -o StrictHostKeyChecking=no -t samplego@$host "sudo /usr/local/bin/supervisorctl restart sample-go"
done
