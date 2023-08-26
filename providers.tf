terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    http = {
      source  = "registry.terraform.io/hashicorp/http"
      version = "~> 3.0"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "~>3.1.0"
    }
  }
}

provider "aviatrix" {
}

# Configure the AWS Provider
provider "aws" {
  region = var.region1
}

provider "aws" {
  alias  = "secondary"
  region = var.region2
}
