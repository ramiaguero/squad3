data "aws_caller_identity" "current" {}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  
  //version = var.module_version
  //for_each = toset(var.repository_names)

  create_lifecycle_policy = false
  repository_image_tag_mutability = var.repository_image_tag_mutability

  //repository_name = each.value  
  //repository_read_write_access_arns = length(var.repository_read_write_access_arns) > 0 ? var.repository_read_write_access_arns : [data.aws_caller_identity.current.arn]
}