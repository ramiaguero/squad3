locals {
  subnets          = module.vpc.subnets_data
  cidr_block       = module.vpc.cidr_blocks
  vpc_id           = module.vpc.vpc_id
  db_parameter_grp = "${local.identifier}-db-par-grp"
  cluster_param_grp = "${local.identifier}-cluster-par-grp"
}

resource "aws_db_parameter_group" "default" {
  name   = local.db_parameter_grp
  family = "aurora-mysql5.7"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  tags = local.tags
}

resource "aws_rds_cluster_parameter_group" "default" {
  name   = local.cluster_param_grp
  family = "aurora-mysql5.7"

  parameter {
    name  = "slow_query_log"
    value = "1"
  }

  tags = local.tags
}

module "rds_aurora" {
  source                              = "terraform-aws-modules/rds-aurora/aws" #not mysql anymore
  version                             = "x.x.x" 
  allowed_cidr_blocks                 = local.cidr_block
  subnets                             = local.subnets
  name                                = local.identifier
  engine                              = local.db_engine
  engine_mode                         = "provisioned"
  engine_version                      = local.engine_version
  apply_immediately                   = true
  replica_count                       = local.reader_nodes
  monitoring_interval                 = 60
  instance_type                       = local.db_instance_type
  kms_key_id                          = local.kms_key
  publicly_accessible                 = local.is_public
  skip_final_snapshot                 = local.skip_final_snapshot
  storage_encrypted                   = true
  deletion_protection                 = false
  iam_database_authentication_enabled = true
  vpc_id                              = local.vpc_id
  database_name                       = local.db_name
  db_cluster_parameter_group_name     = aws_rds_cluster_parameter_group.default.id
  db_parameter_group_name             = aws_db_parameter_group.default.id
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
  username                            = local.db_username
  password                            = data.aws_ssm_parameter.master_password.value
  port                                = 3306
  tags                                = merge({ Name = local.db_name }, local.tags)
}

resource "aws_iam_user_policy_attachment" "attachments" {
  count      = length(local.users)
  user       = element(local.users, count.index)
  policy_arn = aws_iam_policy.rds_connect.arn
}

resource "aws_iam_policy" "rds_connect" {
  name_prefix = "${local.db_name}-policy"
  path        = "/db/"
  policy      = data.aws_iam_policy_document.rds.json
}
