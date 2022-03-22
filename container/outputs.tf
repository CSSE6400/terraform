output "arn" {
  value = aws_instance.instance.arn
  description = "The ARN of the EC2 instance."
}

output "availability_zone" {
  value = aws_instance.instance.availability_zone
  description = "The availability zone of the EC2 instance."
}

output "id" {
  value = aws_instance.instance.id
  description = "The ID of the EC2 instance."
}

output "private_ip" {
  value = aws_instance.instance.private_ip
  description = "The private IP address of the EC2 instance."
}

output "private_dns" {
  value = aws_instance.instance.private_dns
  description = "The private DNS name of the EC2 instance."
}

output "public_ip" {
  value = aws_instance.instance.public_ip
  description = "The public IP address of the EC2 instance."
}

output "public_dns" {
  value = aws_instance.instance.public_dns
  description = "The public DNS name of the EC2 instance."
}

output "subnet_id" {
  value = aws_instance.instance.subnet_id
  description = "The subnet ID of the EC2 instance."
}
