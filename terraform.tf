terraform {
  required_version = "~> 1.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # assume use back the same runners as alz and same storage account
  backend "azurerm" {
    resource_group_name  = "rg-bdonprd2-nprd2-state-southeastasia-006"
    storage_account_name = "stobdonprsou006cyrm"
    container_name       = "nprd2-tfstate"
    key                  = "network.tfstate"
    subscription_id      = "1543411c-a55d-46d6-93bf-2e585fd51376"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "alz_output" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-bdonprd2-nprd2-state-southeastasia-006"
    storage_account_name = "stobdonprsou006cyrm"
    container_name       = "nprd2-tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = "1543411c-a55d-46d6-93bf-2e585fd51376"
  }
}