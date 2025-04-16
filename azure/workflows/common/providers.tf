
terraform {


  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }

  required_version = ">= 1.4.6"
}

resource "random_string" "random_suffix" {
  length  = 6
  special = false
  upper   = false
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id
}

provider "kubernetes" {
  host                   = module.k8s.aks_host
  client_certificate     = base64decode(module.k8s.aks_client_certificate)
  client_key             = base64decode(module.k8s.aks_client_key)
  cluster_ca_certificate = base64decode(module.k8s.aks_cluster_ca_certificate)
}

#provider "kubernetes" {
#host                   = data.azurerm_kubernetes_cluster.aks.kube_config[0].host
#client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
#client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
#cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
#}