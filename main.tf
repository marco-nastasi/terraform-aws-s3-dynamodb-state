resource "aws_s3_bucket" "s3_bucket" {
  bucket_prefix = lower(var.project_name)

  tags = merge(
    {Name = "${var.project_name}-bucket"},
    var.common_tags
  )
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = var.s3_versioning_configuration
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_sse" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_sse_algorithm
    }
  }
}

resource "aws_dynamodb_table" "state_lock_tables" {
  name         = lower(var.project_name)
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"

  tags = merge(
    {
      Name = "${var.project_name}-table"
    },
    var.common_tags
  )
}