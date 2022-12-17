terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.35.0"
    }
  }

  backend "remote" {
    organization = "ycetindil"
    workspaces {
      name = "Terraform-AZ-104-Lab-06"
    }
  }

}

provider "azurerm" {
  features {

  }
}