module "k8s" {
  source       = "../../modules/k8s"
  aks_name     = local.aks_name
  aks_dns_name = local.aks_name
  rg_name      = module.k8s_rg.name
  location     = module.k8s_rg.location

  # Default pool
  node_pool_name              = var.node_pool_name
  node_pool_type              = var.node_pool_type
  node_pool_vm_size           = var.node_pool_vm_size
  node_pool_count             = var.node_pool_count
  os_disk_size_gb             = var.os_disk_size_gb
  node_pool_availability_zone = var.node_pool_availability_zone
  node_pool_max_count         = var.node_pool_max_count
  node_pool_min_count         = var.node_pool_min_count
  max_pods                    = var.node_pool_max_pods

  # Workspace node pool
  base_manage           = var.base_manage
  node_pool_vm_size_wks = var.node_pool_vm_size_wks
  max_pods_wks          = var.node_pool_max_pods_wks
  os_disk_size_gb_wks   = var.os_disk_size_gb_wks

  # Windows node pool
  windows_support       = var.windows_support
  win_node_pool_name    = var.win_node_pool_name
  node_pool_vm_size_win = var.node_pool_vm_size_win
  max_pods_win          = var.node_pool_max_pods_win
  os_disk_size_gb_win   = var.os_disk_size_gb_win
  os_sku_win            = var.os_sku_win
}

resource "kubernetes_namespace" "namespaces_with_istio_inject" {
  count = length(var.base_infra_namespace_with_istio_inject)
  metadata {
    labels = {
      app             = var.base_infra_namespace_with_istio_inject[count.index]
      istio-injection = "enabled"
    }
    name = var.base_infra_namespace_with_istio_inject[count.index]
  }
}

resource "kubernetes_namespace" "namespaces_without_istio_inject" {
  count = length(var.base_infra_namespace_without_istio_inject)
  metadata {
    labels = {
      app = var.base_infra_namespace_without_istio_inject[count.index]
    }
    name = var.base_infra_namespace_without_istio_inject[count.index]
  }
}

#resource "azurerm_role_assignment" "attach_acr" {
# depends_on = [module.k8s, module.common_acr]
# principal needs to be kubelet identity - 
#  see https://stackoverflow.com/questions/59978060/how-to-give-permissions-to-aks-to-access-acr-via-terraform
# principal_id                     = module.k8s.aks_kubelet_identity
# role_definition_name             = "AcrPull"
# scope                            = module.common_acr.id
# skip_service_principal_aad_check = true
#}

resource "kubernetes_storage_class" "ra-azurefile" {
  metadata {
    name = "ra-azurefile"
    labels = {
      "kubernetes.io/cluster-service" = "true"
    }
  }
  allow_volume_expansion = true
  storage_provisioner    = "kubernetes.io/azure-file"
  reclaim_policy         = "Retain"
  volume_binding_mode    = "Immediate"
  mount_options = [
    "file_mode=0777",
    "dir_mode=0777",
    "uid=1001",
    "gid=1001"
  ]
  parameters = {
    skuName = "Standard_LRS"
  }
}

resource "kubernetes_secret" "docker_container_secret" {
  metadata {
    name = var.docker_container_secret_name
    #namespace = var.docker_container_secret_namespace
    namespace = kubernetes_namespace.namespaces_with_istio_inject[0].metadata[0].name
  }

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        (module.common_acr.login_server) = {
          "username" = module.common_acr.admin_username
          "password" = module.common_acr.admin_password
          "auth"     = base64encode("${module.common_acr.admin_username}:${module.common_acr.admin_password}")
        }
      }
    })
  }

  type       = "kubernetes.io/dockerconfigjson"
  depends_on = [module.k8s, module.common_acr]
}

