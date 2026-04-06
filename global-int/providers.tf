terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm" }
  }

  backend "azurerm" {
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
}
