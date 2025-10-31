output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance (if available)"
  value       = aws_instance.app.public_ip
}

output "security_group_id" {
  description = "Security group id"
  value       = aws_security_group.ssh.id
}
