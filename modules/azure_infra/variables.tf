variable "prefix" {
  type        = string
  description = "Naming prefix for resources"
}

variable "st_name" {
  type        = string
  description = "Storage account name"
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}
