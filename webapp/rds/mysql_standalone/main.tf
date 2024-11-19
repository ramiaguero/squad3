#Run the following command to store a password securely:
#aws ssm put-parameter \
  #--name "/production/db/master_password" \
  #--type SecureString \
  #--value "your-secure-password" \
  #--overwrite \
  #--region <region>




# Aurora MySQL Cluster
resource "aws_rds_cluster" "aurora_mysql" {
  cluster_identifier      = "${local.name}-mysql-cluster"
  engine                  = "aurora-mysql"
  engine_version          = "8.0.mysql_aurora.3.03.0"
  master_username         = local.master_username
  master_password         = data.aws_ssm_parameter.master_password.value
  database_name           = local.database_name
  vpc_security_group_ids  = module.vpc.security_group_ids
  db_subnet_group_name    = module.vpc.db_subnet_group_name
  storage_encrypted       = true
  deletion_protection     = false
  apply_immediately       = true
  skip_final_snapshot     = true
  tags                    = local.tags
}

# Aurora Instances
resource "aws_rds_cluster_instance" "aurora_instances" {
  count               = local.instance_count
  identifier          = "${local.name}-mysql-instance-${count.index + 1}"
  cluster_identifier  = aws_rds_cluster.aurora_mysql.id
  instance_class      = local.instance_class
  engine              = aws_rds_cluster.aurora_mysql.engine
  engine_version      = aws_rds_cluster.aurora_mysql.engine_version
  publicly_accessible = false
}

# SSM Parameter for Master Password
data "aws_ssm_parameter" "master_password" {
  name = local.master_password_ssm_param
}

