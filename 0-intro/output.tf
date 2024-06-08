output "web_server_id" {
  value = aws_instance.webapp1.id
}

output "web_server_public_ip" {
  value = aws_instance.webapp1.public_ip
}

output "app_server_id" {
  value = aws_instance.Appserver.id
}

output "app_server_public_ip" {
  value = aws_instance.Appserver.public_ip
}


