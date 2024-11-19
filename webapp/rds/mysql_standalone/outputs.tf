output "cluster_endpoint" {
  value = aws_rds_cluster.aurora_mysql.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.aurora_mysql.reader_endpoint
}

output "instances" {
  value = aws_rds_cluster_instance.aurora_instances[*].id
}