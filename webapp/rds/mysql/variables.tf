# The actual password value (sensitive input)
variable "db_master_password" {
  description = "Master password for the Aurora database"
  type        = string
}

# The SSM parameter name where the password is stored
variable "db_password_ssm_name" {
  description = "Name of the SSM parameter that stores the DB password"
  type        = string
  default     = "/production/db/master_password" # Default SSM parameter name
}
