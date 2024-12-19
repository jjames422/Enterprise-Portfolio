import unittest
from scripts.gcs_acl_check import check_gcs_acl

class TestGCSCompliance(unittest.TestCase):
    def test_non_compliant_bucket(self):
        bucket_name = "public-bucket"
        result = check_gcs_acl(bucket_name)
        self.assertEqual(result, "NON_COMPLIANT")

    def test_compliant_bucket(self):
        bucket_name = "private-bucket"
        result = check_gcs_acl(bucket_name)
        self.assertEqual(result, "COMPLIANT")

if __name__ == "__main__":
    unittest.main()
