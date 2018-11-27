# parse stack
aws --region us-east-1 cloudformation describe-stack-resource --stack-name my-stack-name --query 'StackResourceDetail.PhysicalResourceId' --output text --logical-resource-id DNS Z31OJE14P8IWKC
# create stack
aws --region us-east-1 cloudformation create-stack --stack-name my-stack-name --template-body file://stack.yaml --capabilities CAPABILITY_IAM --parameters ParameterKey=KeyName,ParameterValue=mykey
