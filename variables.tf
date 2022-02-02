variable "name" {
  type        = string
  description = "Name of the App"
}

variable "domain" {
  type        = string
  default     = null
  description = "Custom domain for the app"
}

variable "domain-zone-id" {
  type        = string
  description = "ID of Route 53 domain zone for the app"
}

variable "certificate" {
  type        = string
  default     = null
  description = "ARN of the certificate for the domain"
}

variable "gui" {
  type = object({
    path       = string
    entrypoint = string
    source = object({
      type  = string
      files = string
    })
  })
  description = "GUI layer configuration - API path, default document (entrypoint), storage type, path to directory with source files."
}

variable "api" {
  type = object({
    path = string
    business-logic = object({
      type     = string
      resource = any
    })
  })
  description = "API layer configuration - API path, business logic resource type (lambda, load balancer, etc) and ARN."
}

variable "db" {
  type = object({
    source = object({
      type         = string
      resource-arn = string
    })
  })
}

variable "s3-logs-bucket" {
  type        = string
  description = "Name of the S3 bucket collecting all S3 Bucket Access Logs"
}

variable "tags" {
  type        = map(any)
  description = "Resource tags to be attached to all resources."
}

variable "aws-partition" {
  type        = string
  description = "Name of current AWS partition"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "log-retention-days" {
  type        = number
  default     = 7
  description = "Period, in days, to store App access logs in CloudWatch"
}

variable "shared-kms-key" {
    type = string
    description = "ARN of the KMS key used for log data encryption"
}