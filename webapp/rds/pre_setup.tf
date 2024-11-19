locals {
  iam_usernames = ["user1", "user2", "user3"] # Replace with actual usernames
}

# Fetch current region and account information
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# KMS Key for DB Encryption
resource "aws_kms_key" "db_encryption" {
  description = "KMS key for Aurora database encryption"
  key_usage   = "ENCRYPT_DECRYPT"
  tags = {
    Name        = "aurora-encryption-key"
    Environment = "development"
  }
}

resource "aws_kms_alias" "db_encryption_alias" {
  name          = "alias/aurora-encryption-key"
  target_key_id = aws_kms_key.db_encryption.id
}

# SSM Parameter for DB Password
resource "aws_ssm_parameter" "db_master_password" {
  name        = "/production/db/master_password"
  type        = "SecureString"
  value       = var.db_master_password
  description = "Master password for the Aurora database"
  tags = {
    Environment = "development"
  }
}

# IAM User Policy and Attachment
resource "aws_iam_policy" "rds_connect" {
  name_prefix = "rds-connect-policy"
  path        = "/db/"
  policy      = data.aws_iam_policy_document.rds_policy.json
}

data "aws_iam_policy_document" "rds_policy" {
  statement {
    effect  = "Allow"
    actions = ["rds-db:connect"]
    resources = [
      "arn:aws:rds-db:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:dbuser/*"
    ]
  }
}

resource "aws_iam_user_policy_attachment" "rds_policy_attachments" {
  count      = length(local.iam_usernames)
  user       = element(local.iam_usernames, count.index)
  policy_arn = aws_iam_policy.rds_connect.arn
}
