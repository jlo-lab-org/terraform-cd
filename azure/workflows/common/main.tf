#data "azurerm_kubernetes_cluster" "aks" {
# name                = local.aks_name
#resource_group_name = local.rg_k8s
#}

locals {
  rg_general = "${var.env_prefix}-${var.env_name}-rg-general"
  asb_name   = "${var.env_prefix}-${var.env_name}-asb"
}