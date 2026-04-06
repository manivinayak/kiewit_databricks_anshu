module "base_infra" {
  source              = "../modules/azure_infra"
  prefix              = local.prefix
  st_name             = local.st_name
  rg_name             = var.resource_group
  location            = var.location
}