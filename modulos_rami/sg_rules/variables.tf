variable "sg_id" {
  description = "ID of the security group to attach rules to"
  type        = string
}

variable "rules" {
  description = "List of rules for the security group"
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}
