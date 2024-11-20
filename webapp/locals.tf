locals {
  vpc_name = "web-app-vpc"
  vpc_cidr = "172.16.0.0/22"
  tags = {
    Environment = "prod"
    Terraform   = "true"
  }
}
#ssl certificate locals
locals {
  domain_name = "teracloud.lat"
}
#sg locals
locals {
  environment = "prod"
  project     = "web-app"
  asg_tags = merge(
    local.tags,
    {
      Cluster_name = local.ecs_cluster_name,
      Name         = "${local.ecs_cluster_name}-instance"
    }
  )
}
#ecs locals
locals {
  ecs_cluster_name  = "web-app-cluster"
  public_ip         = false
  instance_type     = "t3.micro"
  enable_monitoring = true
  max_size          = 3
  min_size          = 2
  desired_size      = 2
}

# RDS locals
locals {
  cluster_name          = "aurora-mysql-cluster"
  engine                = "aurora-mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.medium"
  monitoring_interval   = 10
  master_username       = "interns"
  master_password       = "TestingPassword123!" # TEMPORARY FOR TESTING ONLY
  cloudwatch_logs_exports = ["general"]
}
