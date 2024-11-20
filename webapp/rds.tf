resource "aws_db_subnet_group" "default" {
  name        = "my-db-subnet-group"
  description = "Subnet group for RDS Aurora cluster"
  subnet_ids  = module.vpc.database_subnets  

  tags = local.tags
}

module "mysql_cluster" {
  source = "terraform-aws-modules/rds-aurora/aws"

  name           = local.cluster_name
  engine         = "aurora-mysql"
  engine_version = local.engine_version
  instance_class = local.instance_class
  create_security_group = false
  skip_final_snapshot = true
  instances = {
    default = {}
  }

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = "my-db-subnet-group"

  master_username       = local.master_username
  master_password       = local.master_password # TEMPORARY FOR TESTING
  monitoring_interval   = local.monitoring_interval
  enabled_cloudwatch_logs_exports = local.cloudwatch_logs_exports

  storage_encrypted     = true
  kms_key_id            = "arn:aws:kms:us-east-2:253490770873:key/c77967f5-8caa-46b1-8183-cc6ed2251164"
  apply_immediately     = true

  tags = local.tags


  vpc_security_group_ids = [module.sg_rds.sg_id]
  
}