output "aurora_cluster_id" {
  description = "The ID of the Aurora PostgreSQL cluster"
  value       = module.aurora_postgresql.this_rds_cluster_id
}

output "aurora_endpoint" {
  description = "The endpoint of the Aurora PostgreSQL cluster"
  value       = module.aurora_postgresql.this_rds_cluster_endpoint
}
