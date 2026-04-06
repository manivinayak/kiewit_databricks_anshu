resource "azurerm_resource_group" "this" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "this" {
  name                     = var.st_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "unity" {
  name                  = "unity-catalog"
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}

resource "azurerm_databricks_access_connector" "this" {
  name                = "${var.prefix}-connector"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  identity { type = "SystemAssigned" }
}

resource "azurerm_role_assignment" "connector_storage" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}

resource "azurerm_databricks_workspace" "this" {
  name                = "${var.prefix}-workspace"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "premium"
}

output "workspace_url" { value = azurerm_databricks_workspace.this.workspace_url }
output "workspace_id" { value = azurerm_databricks_workspace.this.workspace_id }
output "storage_account_name" { value = azurerm_storage_account.this.name }
