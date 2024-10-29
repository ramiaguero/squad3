provider "aws" {
  region = "us-east-2"
}

module "sg" {
  source      = "./sg"
  name        = var.sg_name
  vpc_id      = var.vpc_id
  environment = var.environment
  project     = var.project
}

module "sg_rules" {
  source = "./sg_rules"
  sg_id  = module.sg.sg_id
  rules = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP"
    },
    {
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTPS"
    }
  ]
}

output "sg_id" {
  value = module.sg.sg_id
}

output "sg_name" {
  value = module.sg.sg_name
}
