terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

resource "databricks_catalog" "this" {
  name    = var.catalog_name
  comment = "Dynamic Catalog for ${var.project_id}"
}

resource "databricks_grant" "de_team" {
  catalog    = databricks_catalog.this.name
  principal  = var.de_group
  privileges = ["ALL_PRIVILEGES"] # Allows UI-based pipeline creation
}

resource "databricks_cluster_policy" "ui_policy" {
  name = "${var.project_id}-ui-policy"
  definition = jsonencode({
    "autotermination_minutes" : { "type" : "fixed", "value" : 60 }
  })
}
