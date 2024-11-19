locals {
  identifier        = "my-cluster"
  subnets           = module.vpc.subnets_data
  cidr_block        = module.vpc.cidr_blocks
  db_engine         = "aurora-mysql"
  db_username       = "admin"
  db_name           = "mydatabase"
  engine_version    = "5.7"
  vpc_id            = module.vpc.vpc_id
  db_instance_type  = "db.t3.medium"
  kms_key           = ""
  reader_nodes      = 0
  is_public         = false
  skip_final_snapshot = false
  tags = {
    environment = "dev"
    terraform   = "true"
  }
  users = []
}
