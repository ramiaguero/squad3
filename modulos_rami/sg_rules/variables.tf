variable "sg_id" {
  type        = string
  description = "ID of the security group to apply the rule"
}

variable "type" {
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

variable "description" {
  type        = string
  description = "Description of the rule"
}
