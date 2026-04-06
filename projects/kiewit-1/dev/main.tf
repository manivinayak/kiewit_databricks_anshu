# terraform/projects/kiewit-1/dev/main.tf

# 1. Use the variables to calculate the name of the workspace to find
data "azurerm_databricks_workspace" "this" {
  name                = "kiewit-${var.environment}-workspace"
  resource_group_name = var.resource_group
}

# 2. Feed that discovered URL into the provider
provider "databricks" {
  host = data.azurerm_databricks_workspace.this.workspace_url
}

# 3. Deploy the Unity Catalog using your dynamic locals
module "unity_setup" {
  source       = "../../../modules/unity_catalog"
  project_id   = local.project_id
  catalog_name = local.catalog_name
  de_group     = local.de_group
}