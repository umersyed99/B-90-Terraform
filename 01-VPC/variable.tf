variable "ofl_project_name" {
  type    = string
  default = "OpsFusionLabs"
}

variable "ofl_project_creator" {
  type    = string
  default = "Terraform"
}

variable "prj_sn" {
  type = string
  default = "ofl"
}


variable "ofl_region" {
  type    = string
  default = "ap-south-1"

}

variable "ofl_dev-cidr-range" {
  type        = string
  default     = "10.17.0.0/24"
  description = "CIDIR BLOCK"
}


variable "ofl_prod-cidr-range" {
  type        = string
  default     = "10.11.0.0/24"
  description = "CIDIR BLOCK"
}
variable "ofl_az" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "ofl_public_subnet_cidr" {
  type    = list(string)
  default = ["10.17.0.0/26", "10.17.0.64/26"]
}


variable "ofl_subnet_private_cidr" {
  type    = list(string)
  default = ["10.17.0.128/26", "10.17.0.192/26"]
}
