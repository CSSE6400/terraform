terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

locals {
  ami = "ami-0a8b4cd432b1c3063"
  user_data = <<-EOT
#!/bin/bash
yum update -y
yum install -y docker
service docker start
systemctl enable docker
usermod -a -G docker ec2-user
docker run ${local.environment} ${local.ports} ${local.image}
  EOT
}

resource "aws_launch_template" "template" {
  image_id      = local.ami
  instance_type = local.instance_type
  user_data = base64encode(local.user_data)
  vpc_security_group_ids = local.security_groups

  tag_specifications {
    resource_type = "instance"

    tags = local.tags
  }
}