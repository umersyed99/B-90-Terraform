resource "aws_instance" "webapp1" {
  tags = {
    "Name"    = "Webserver"
    "Creator" = "terraform"
  }
  instance_type = var.lwp_instance_type
  ami           = var.lwp_ami
}



resource "aws_instance" "Appserver" {
  ami           = var.lwp_ami
  instance_type = var.lwp_instance_type
  tags = {
    "Name"    = "App Server"
    "Creator" = "terraform"
  }
}