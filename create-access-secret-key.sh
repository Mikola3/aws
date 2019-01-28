#!/bin/bash
AccessKey=$(aws iam create-user --user-name ${AWS::StackName} | jq -r '.User | .UserId')
SecretKey=$(aws iam create-access-key --user-name ${AWS::StackName} | jq -r '.AccessKey | .SecretAccessKey')
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonSQSFullAccess --user-name ${AWS::StackName}
# further use of variables
docker run --name=fcm -d -e ACCESS_KEY=$AccessKey -e SECRET_KEY=$SecretKey docker_image
