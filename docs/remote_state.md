
# Remote state (S3 + DynamoDB)

1. Create S3 bucket (unique name) and DynamoDB for locks.

AWS CLI example (replace placeholders):
aws s3api create-bucket --bucket <STATE_BUCKET_NAME> --region <AWS_REGION> --create-bucket-configuration LocationConstraint=<AWS_REGION>

aws dynamodb create-table \
  --table-name <DYNAMODB_TABLE> \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
