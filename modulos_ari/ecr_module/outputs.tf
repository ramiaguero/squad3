################################################################################
# Module Version
################################################################################

output "module_version" {
  description = "The version of the ECR module in use"
  value       = var.module_version
}

################################################################################
# Repository (Public and Private)
################################################################################

output "repository_arns" {
  description = "Full ARN of the repository"
  value = { for k, v in module.ecr : k => v.repository_arn }
}

output "repository_registry_ids" {
  description = "The registry ID where the repository was created"
  value = { for k, v in module.ecr : k => v.repository_registry_id }
}

output "repository_urls" {
  description = "Full ARN of the repository"
  value = { for k, v in module.ecr : k => v.repository_url }
}