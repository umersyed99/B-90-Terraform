# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "${var.ofl_project_name}-${terraform.workspace}"
#   cidr = "10.0.0.0/16"

#   azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = false

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }


module "vpc" {
  source = "git::https://github.com/vedantguptha/b90-terraform-modules.git//vpc"
  name = "ofl"
  cidr_block = "10.0.0.0/16"
  
  public_subnets_name = ["Jumphost", "webserver"]
  azs = ["ap-south-1a", "ap-south-1b"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  private-subnet = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_private = true
  tags = {
    Name = "Test-vpc"
  }

}