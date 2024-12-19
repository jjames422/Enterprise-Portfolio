import boto3

def evaluate_s3_compliance(bucket_name):
    s3 = boto3.client('s3')
    bucket_acl = s3.get_bucket_acl(Bucket=bucket_name)
    for grant in bucket_acl['Grants']:
        if grant['Grantee'].get('URI') == 'http://acs.amazonaws.com/groups/global/AllUsers':
            return "NON_COMPLIANT"
    return "COMPLIANT"

def lambda_handler(event, context):
    bucket_name = event['bucket_name']
    compliance_status = evaluate_s3_compliance(bucket_name)
    return {"Bucket": bucket_name, "ComplianceStatus": compliance_status}
