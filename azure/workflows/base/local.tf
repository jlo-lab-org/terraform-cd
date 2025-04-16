locals {
  rg_k8s               = "rg-ede-${var.user_name}-${var.env_prefix}-${var.env_name}"
  aks_name             = "${var.env_prefix}-${var.env_name}-aks-cluster-${var.cluster_index}"
  app_gw_name          = "${var.env_prefix}-${var.env_name}-app-gateway"
  mysql_server_name    = "${var.env_prefix}-${var.env_name}-mysql"
  acr_name             = "${var.env_prefix}-${var.env_name}-acr"
  redis_name           = "${var.env_prefix}-${var.env_name}-redis"
  cosmosdb_server_name = "${var.env_prefix}-${var.env_name}-cosmosdb"
  aks_rg_name          = "${var.env_prefix}-${var.env_name}-rg-aks-cluster"
  aks_nrg_name         = "${var.env_prefix}-${var.env_name}-rg-aks-cluster-%03d-resources"
  aks_vnet_name        = "${var.env_prefix}-${var.env_name}-vnet-%03d"
  # aks_lb_publicip_name        = "${var.env_prefix}-${var.env_name}-%03d-aks-lb-pip"
  aks_subnet_name = "${var.env_prefix}-${var.env_name}-${var.cluster_index}-aks-subnet"
}