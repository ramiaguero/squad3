locals {
  cluster_name          = "aurora-postgresql-cluster"
  engine_version        = "14.5"
  instance_class        = "db.t2.micro"
  monitoring_interval   = 10
  master_username       = "admin"
  cloudwatch_logs_exports = ["postgresql"]
  tags = {
    Environment = "development"
    Project     = "Internship"
    Owner       = "Ramiro Aguero"
  }
}
