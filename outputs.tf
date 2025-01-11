output "s3_bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB tables"
  value       = aws_dynamodb_table.state_lock_tables.name
}