variable "lwp_region" {
  description = "Aws Region"
  type        = string
  default     = "ap-south-1"
}

variable "lwp_ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-05a5bb48beb785bf1"
}

variable "lwp_instance_type" {
  type    = string
  default = "t2.micro"
}