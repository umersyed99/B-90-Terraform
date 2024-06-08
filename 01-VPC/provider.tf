terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.0"
    }
  }
}

provider "aws" {
  region = var.ofl_region
  default_tags {
    tags = {
      Project = var.ofl_project_name
      Creator = var.ofl_project_creator
      Env     = title(terraform.workspace)
    }
  }
}