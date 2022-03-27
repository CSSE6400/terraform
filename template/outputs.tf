output "arn" {
  value = aws_launch_template.template.arn
  description = "The ARN of the template."
}

output "id" {
  value = aws_launch_template.template.id
  description = "The ID of the template."
}
