variable "name" {
  type        = string
  description = "Name of the App"
}

variable "domain" {
  type        = string
  default     = null
  description = "Custom domain for the app"
}

variable "domain_zone_id" {
  type        = string
  default     = null
  description = "ID of Route 53 domain zone for the app"
}

variable "certificate" {
  type        = string
  default     = null
  description = "ARN of the certificate for the domain"
}

variable "gui" {
  type = object({
    path          = string
    entrypoint    = string
    path_to_files = string
  })
  description = "GUI layer configuration - API path, default document (entrypoint), path to directory with source files."
}

variable "api" {
  type = object({
    path = string
    business_logic = object({
      function_arn  = string
      function_name = string
    })
  })
  description = "API layer configuration - API path, ARN and name of the lambda function used as a business logic for the app."
}

variable "s3_access_logs_bucket" {
  type        = string
  default     = null
  description = "Name of the S3 bucket collecting all S3 Bucket Access Logs"
}

variable "tags" {
  type        = map(any)
  description = "Resource tags to be attached to all resources."
}

variable "aws_partition" {
  type        = string
  description = "Name of current AWS partition"
}

variable "aws_account_id" {
  type        = string
  description = "ID of current AWS Account"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "log_retention_days" {
  type        = number
  default     = 7
  description = "Period, in days, to store App access logs in CloudWatch"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "ARN of the KMS key used for log data encryption"
}

variable "enable_access_logging" {
  type        = bool
  default     = true
  description = "Enables access logging at API level. Logs will be sent to the CloudWatch group with name {app-name}-access-logs."
}

variable "enable_execution_logging" {
  type        = bool
  default     = true
  description = "Enables API execution logging. Logs will be sent to the standard API Gateway CloudWatch group."
}

variable "log_full_requests" {
  type        = bool
  default     = false
  description = "Enables or disables full request logging in execution logs. Logs are sent into execution logs group."
}

variable "disable_aws_url" {
  type = bool
  default = false
  description = "Disables AWS-provided URL for the App and its API."
}

variable "auth_config" {
  type = object({
    enabled = bool
    log_level = optional(string)
    auth_endpoint_prefix = optional(string)
    cognito = optional(object({
      domain = string
      userpool_id = string
      client_id = string
      secret = string
    }))
  })

  default = {
    enabled = false
    log_level = "INFO"
    auth_endpoint_prefix = "cognito-idp-response"

    cognito = {
      domain = ""
      userpool_id = ""
      client_id = ""
      secret = ""
    }
  }

  description = "Authentication config for protecting the App and API with Cognito authentication."
}
