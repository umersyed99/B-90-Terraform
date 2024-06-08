resource "aws_instance" "web" {
  ami = var.ofl_ami
  instance_type = var.ofl-instance-type
  subnet_id = aws_subnet.ofl-ecom-public-subnets[0].id
  key_name = aws_key_pair.ofl-key-pair.key_name
  security_groups = [aws_security_group.ofl-allow-ssh-connection.id, aws_security_group.ofl-webserver-connection.id]
  tags = {
    Name = title("${var.prj_sn}-${terraform.workspace}-Web-Server")
  }
}