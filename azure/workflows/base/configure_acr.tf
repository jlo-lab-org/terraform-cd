module "common_acr" {
  source                     = "../../modules/acr"
  rg_name                    = local.rg_k8s
  location                   = var.location
  acr_sku                    = var.acr_sku
  env_prefix                 = var.env_prefix
  env_name                   = var.env_name
  acr_admin_enabled          = var.acr_admin_enabled
  acr_name                   = "${var.env_prefix}${var.env_name}registry"
  acr_public_network_enabled = var.acr_public_network_enabled
  depends_on                 = [module.k8s_rg]
}