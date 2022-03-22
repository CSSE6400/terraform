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