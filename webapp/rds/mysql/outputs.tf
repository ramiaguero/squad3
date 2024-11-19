output "rds_endpoint" {
  description = "The RDS cluster endpoint"
  value       = module.rds_aurora.this_rds_cluster_endpoint
}

output "security_group_id" {
  description = "The RDS cluster security group ID"
  value       = module.rds_aurora.this_security_group_id
}
