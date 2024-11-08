resource "aws_security_group" "sg" {
  description = "${var.name} ${var.environment} security group"
  name_prefix = format("%s-%s-", var.name, var.environment)
  vpc_id      = var.vpc_id

  tags = merge(
    {
      environment = var.environment
      project     = var.project
      managed_by  = "terraform"
      Name        = var.name
    },
    var.tags
  )
}
