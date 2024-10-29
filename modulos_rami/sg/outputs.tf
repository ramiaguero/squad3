output "sg_id" {
  value       = aws_security_group.sg.id
  description = "ID of the created security group"
}

output "sg_name" {
  value       = aws_security_group.sg.name
  description = "Name of the created security group"
}
