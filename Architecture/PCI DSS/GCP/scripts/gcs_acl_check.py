from google.cloud import storage

def check_gcs_acl(bucket_name):
    client = storage.Client()
    bucket = client.get_bucket(bucket_name)
    for entry in bucket.acl:
        if entry.get("entity") == "allUsers" or entry.get("entity") == "allAuthenticatedUsers":
            return "NON_COMPLIANT"
    return "COMPLIANT"

if __name__ == "__main__":
    bucket_name = "your-bucket-name"
    status = check_gcs_acl(bucket_name)
    print(f"Bucket {bucket_name} is {status}")
