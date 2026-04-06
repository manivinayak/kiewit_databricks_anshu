terraform {
  required_providers {
    databricks = { source = "databricks/databricks" }
    azurerm    = { source = "hashicorp/azurerm" }
  }

  backend "azurerm" {
    use_oidc = true
  }
}

provider "azurerm" {
  features {}
}
