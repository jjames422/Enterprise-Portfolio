import boto3
import logging

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize the S3 client
s3 = boto3.client('s3')

def lambda_handler(event, context):
    """
    AWS Lambda function to read files from an S3 bucket and log their content.
    """
    bucket_name = 'your-bucket-name'
    file_key = 'example.txt'

    try:
        # Get the object from the bucket
        response = s3.get_object(Bucket=bucket_name, Key=file_key)
        file_content = response['Body'].read().decode('utf-8')
        
        # Log the content
        logger.info(f"File Content: {file_content}")
        return {
            'statusCode': 200,
            'body': f"Read content: {file_content}"
        }
    except Exception as e:
        logger.error(f"Error reading file from S3: {str(e)}")
        return {
            'statusCode': 500,
            'body': f"Error: {str(e)}"
        }

  Deployment Instructions
	1.	Zip the file and upload it to AWS Lambda.
	2.	Assign the Lambda function permissions to access the S3 bucket using an IAM role.
