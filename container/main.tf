locals {
  ami = "ami-0a8b4cd432b1c3063"
}

resource "aws_instance" "instance" {
  ami           = local.ami
  instance_type = local.instance_type
  user_data = <<-EOT
#!/bin/bash
yum update -y
yum install -y docker
service docker start
systemctl enable docker
usermod -a -G docker ec2-user
docker run ${local.environment} ${local.ports} ${local.image}
  EOT
  security_groups = local.security_groups

  tags = local.tags
}