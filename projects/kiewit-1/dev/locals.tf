locals {
  project_id = "kiewit-1"
  env        = var.environment
  # Dynamically generated catalog name
  catalog_name = "${local.project_id}_${local.env}_catalog"
  # Group existing in your Entra ID/Databricks
  de_group = "${local.project_id}-de-team"
}
