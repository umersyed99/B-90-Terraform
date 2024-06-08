##################################################################
##                       VPC Creation                           ##
##################################################################
resource "aws_vpc" "ofl-ecom-dev-vpc" {
  cidr_block           = terraform.workspace == "dev" ? var.ofl_dev-cidr-range : var.ofl_prod-cidr-range 
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = title("${var.prj_sn}-${terraform.workspace}-vpc")
  }
}


##################################################################
##                   Public Subnet - 1                         ##
##################################################################

resource "aws_subnet" "ofl-ecom-public-subnets" {
  count = length(var.ofl_public_subnet_cidr)  
  vpc_id                  = aws_vpc.ofl-ecom-dev-vpc.id
  cidr_block              = var.ofl_public_subnet_cidr[count.index]
  availability_zone       = var.ofl_az[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = title("${var.prj_sn}-${terraform.workspace}-Public-Subnet-${count.index+1}")
  }
  depends_on = [aws_vpc.ofl-ecom-dev-vpc]
}


##################################################################
##                       IGW Creation                           ##
##################################################################

resource "aws_internet_gateway" "ofl-ecom-igw" {
  vpc_id = aws_vpc.ofl-ecom-dev-vpc.id
  tags = {
    Name = title("${var.prj_sn}-${terraform.workspace}-IGW")
  }
}


##################################################################
##                       Public RT                              ##
##################################################################

resource "aws_route_table" "ofl-ecom-prt" {
  vpc_id = aws_vpc.ofl-ecom-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ofl-ecom-igw.id
  }
  tags = {
   Name = title("${var.prj_sn}-${terraform.workspace}-PRT")
  }
}


resource "aws_route_table_association" "ecom-accoc-public-subnets" {
  count = length(var.ofl_public_subnet_cidr)
  subnet_id      = element(aws_subnet.ofl-ecom-public-subnets[*].id, count.index)
  route_table_id = aws_route_table.ofl-ecom-prt.id
}
