output "vpc-id" {
  value = aws_vpc.ofl-ecom-dev-vpc.id
}
output "ofl-vpc-cidr" {
  value = aws_vpc.ofl-ecom-dev-vpc.cidr_block
}

output "ofl-subnets-ids" {
  value = aws_subnet.ofl-ecom-public-subnets[0].id
}