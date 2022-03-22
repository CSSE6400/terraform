

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment variables to set in the container. | `map` | `{}` | no |
| <a name="input_image"></a> [image](#input\_image) | The image to use for the container, e.g. `ubuntu:latest` or `gcr.io/my-project/my-image:latest` | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | [AWS instance type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#instance_type) | `string` | n/a | yes |
| <a name="input_ports"></a> [ports](#input\_ports) | The ports to map in the container, e.g. `{80: 8000}` to map port 80 of the EC2 instance to port 8000 in the container. | `map` | `{}` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The names of security groups to associate with the container e.g. `['sg-12345678']`. | `list` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The [AWS tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#tags) to associate with the container. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the EC2 instance. |
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | The availability zone of the EC2 instance. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the EC2 instance. |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | The private DNS name of the EC2 instance. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private IP address of the EC2 instance. |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | The public DNS name of the EC2 instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the EC2 instance. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The subnet ID of the EC2 instance. |

## Examples

```hcl
module "todoapp-backend" {
  source = "git::https://github.com/CSSE6400/terraform//container"
  
  image = "ghcr.io/csse6400/todo-app:latest"
  instance_type = "t2.micro"
  environment = {
    DB_CONNECTION="mysql"
    DB_HOST=aws_db_instance.todoapp-database.address
    DB_PORT="3306"
    DB_DATABASE="todoapp"
    DB_USERNAME="todoapp"
  }
  ports = {
    "80" = "8000"
  }
  security_groups = [aws_security_group.todoapp-backend.name]

  tags = {
    Name = "todoapp-backend"
  }
}

output "url" {
  value = module.todoapp-backend.public_dns
  description = "The URL of the backend."
}
```
