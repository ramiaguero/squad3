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

variable "rule_type" {
  type        = string
  description = "Type of rule (ingress or egress)"
}

variable "from_port" {
  type        = number
  description = "Starting port for the rule"
}

variable "to_port" {
  type        = number
  description = "Ending port for the rule"
}

variable "protocol" {
  type        = string
  description = "Protocol for the rule (e.g., 'tcp', 'udp', '-1' for all)"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks for rule scope"
}

variable "rule_description" {
  type        = string
  description = "Description of the rule"
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
