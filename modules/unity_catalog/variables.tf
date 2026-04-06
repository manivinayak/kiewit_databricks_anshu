variable "catalog_name" {
  type        = string
  description = "Databricks catalog name"
}

variable "project_id" {
  type        = string
  description = "Project identifier"
}

variable "de_group" {
  type        = string
  description = "Data engineering group name"
}

variable "storage_location" {
  type        = string
  description = "ADLS Gen2 abfss:// path to use as Unity Catalog storage root"
}
