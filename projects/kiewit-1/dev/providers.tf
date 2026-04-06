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

provider "databricks" {
  host = data.azurerm_databricks_workspace.this.workspace_url
}
