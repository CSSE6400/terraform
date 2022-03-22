variable "image" {
  type = string
  description = "The image to use for the container, e.g. `ubuntu:latest` or `gcr.io/my-project/my-image:latest`"
}

variable "instance_type" {
  type = string
  description = "[AWS instance type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#instance_type)"
}

variable "environment" {
  type = map
  description = "The environment variables to set in the container."
  default = {}
}

variable "ports" {
  type = map
  description = "The ports to map in the container, e.g. `{80: 8000}` to map port 80 of the EC2 instance to port 8000 in the container."
  default = {}
}

variable "security_groups" {
  type = list
  description = "The names of security groups to associate with the container e.g. `['sg-12345678']`."
  default = []
}

variable tags {
  type = map
  description = "The [AWS tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#tags) to associate with the container."
  default = {}
}

locals {
  image = var.image
  instance_type = var.instance_type
  environment = join(" ", [for k, v in var.environment : "--env ${k}=${v}"])
  ports = join(" ", [for k, v in var.ports : "-p ${k}:${v}"])
  security_groups = var.security_groups
  tags = var.tags
}
