#!/bin/bash
AccessKey=$(aws iam create-user --user-name ${AWS::StackName} | jq -r '.User | .UserId')
SecretKey=$(aws iam create-access-key --user-name ${AWS::StackName} | jq -r '.AccessKey | .SecretAccessKey')
# attach policy on the created user
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonSQSFullAccess --user-name ${AWS::StackName}
