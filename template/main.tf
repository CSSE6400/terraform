terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

locals {
  login = var.github_pat != "" ? "echo ${var.github_pat} | docker login ghcr.io -u ${var.github_user} --password-stdin" : ""
  user_data = <<-EOT
#!/bin/bash
yum update -y
yum install -y docker
service docker start
systemctl enable docker
usermod -a -G docker ec2-user
${local.login}
docker run --hostname $(ec2-metadata -p | cut -f 2 -d' ') ${local.environment} ${local.ports} ${local.image}
  EOT
}

resource "aws_launch_template" "template" {
  image_id      = local.ami
  instance_type = local.instance_type
  user_data = base64encode(local.user_data)
  vpc_security_group_ids = local.security_groups

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = true
      volume_size = var.storage_size
    }
  }

  iam_instance_profile {
    name = var.iam_role
  }

  tag_specifications {
    resource_type = "instance"

    tags = local.tags
  }
}