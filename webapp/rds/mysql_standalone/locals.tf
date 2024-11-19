locals {
  name                      = "placeholder-name"                # Base name for the resources
  master_username           = "admin"                          # Database master username
  master_password_ssm_param = "/path/to/ssm/parameter"         # SSM parameter path for the DB password
  database_name             = "placeholder_db"                 # Name of the MySQL database
  instance_class            = "db.r6g.large"                   # Instance type
  instance_count            = 2                                # Number of Aurora instances
  vpc_id                    = module.vpc.vpc_id                # VPC ID from another module
  db_subnet_group_name      = module.vpc.db_subnet_group_name  # Subnet group from another module
  security_group_ids        = module.vpc.security_group_ids    # Existing security group IDs
  tags = {
    Environment = "dev"
    Project     = "placeholder-project"
  }
}
