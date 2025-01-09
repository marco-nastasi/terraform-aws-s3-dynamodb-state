# Terraform S3 and DynamoDB Module

This module creates multiple S3 buckets and DynamoDB tables, configured for use as Terraform state storage.

## Inputs

- `project_name`: String containing the name of the project. It will be used to name the S3 bucket and the DynamoDB table.
- `common_tags`: Map of strings containing the tags. Example:
  ```hcl
  common_tags = {
    Env     = "Dev"
    Project = "Test Project"
  }
  ```
  - `s3_versioning_configuration`: Boolean that indicates if versioning is `"Enabled"` or `"Disabled"` for the bucket.
  - `s3_sse_algorithm`: Encryption algorithm for the S3 bucket. By default it is set to `AES256`

## Outputs

- `s3_bucket_id`: The ID of the created S3 bucket.
- `dynamodb_table_name`: The name of the created DynamoDB table.

## Example Usage

```hcl
module "state_storage" {
  source = "./terraform-s3-dynamodb"

  project_name = "aws-test-project1"
  common_tags = {
    Env     = "Dev"
    Project = "Test Project"
  }
}
```