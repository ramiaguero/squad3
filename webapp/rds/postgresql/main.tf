module "aurora_postgresql" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  name           = local.cluster_name
  engine         = "aurora-postgresql"
  engine_version = local.engine_version
  instance_class = local.instance_class

  instances = {
    one = {}
  }

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.db_subnet_group_name

  storage_encrypted   = true
  kms_key_id          = data.aws_kms_key.encryption_key.arn
  apply_immediately   = true
  monitoring_interval = local.monitoring_interval

  master_username = local.master_username
  master_password = data.aws_ssm_parameter.master_password.value

  enabled_cloudwatch_logs_exports = local.cloudwatch_logs_exports

  tags = local.tags
}
