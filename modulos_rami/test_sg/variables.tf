variable "sg_name" {
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

variable "rules" {
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  description = "List of security group rules"
  default     = []
}
