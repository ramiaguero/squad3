variable "name" {
  type        = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "environment" {
  type        = string
  description = "Environment for tagging (e.g., 'dev', 'prod')"
}

variable "project" {
  type        = string
  description = "Project name for tagging"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to the security group"
  default     = {}
}
