module "resource_group" {
  source   = "../../modules/resource-group"
  rg_name  = local.rg_general
  location = var.location
  tags     = var.tags
}