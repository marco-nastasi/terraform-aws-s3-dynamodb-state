variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "common_tags" {
  description = "Map containing common tags for all resources"
  type = map(string)
}

variable "s3_versioning_configuration" {
  description = "Versioning configuration for S3 bucket"
  type        = string
  default     = "Enabled"
}

variable "s3_sse_algorithm" {
  description = "SSE Algorithm for S3 bucket"
  type        = string
  default     = "AES256"
}