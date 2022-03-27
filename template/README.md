

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [aws_launch_template.template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |

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
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the template. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the template. |
