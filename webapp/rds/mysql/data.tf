# First create the parameter from awscli:
# aws ssm put-parameter --name /production/db/master_password --type SecureString --value xxxxx --overwrite --region us-east-1
# Testing a pre_setup.tf to sort above steps

# Fetch the DB password from the specified SSM parameter
data "aws_ssm_parameter" "master_password" {
  name = var.db_password_ssm_name # Clear reference to the SSM parameter name
}

# Fetch AWS account and region information
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# Generate an IAM policy document for RDS connection
data "aws_iam_policy_document" "rds" {
  statement {
    effect  = "Allow"
    actions = ["rds-db:connect"]
    resources = [
      "arn:aws:rds-db:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:dbuser:${module.rds_aurora.this_rds_cluster_resource_id}/terraform"
    ]
  }
}
