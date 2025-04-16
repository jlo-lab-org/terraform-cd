#variable "azure_subscription_id_global" {}

variable "location" {
  default     = "centralus"
  description = "Location of the resource group."
}

variable "env_prefix" {
  default = "ftdsu"
}

variable "acr_sku" {
  default = "Standard"
  type    = string
}
variable "acr_admin_enabled" {
  default = true
  type    = bool
}
variable "acr_zone_redundancy_enabled" {
  default = true
  type    = bool
}
variable "georeplications_zone_redundancy_enabled" {
  default = true
  type    = bool
}
variable "georeplications_regional_endpoint_enabled" {
  default = false
  type    = bool
}
variable "acr_name" {
  default = "acr-test"
}
variable "acr_public_network_enabled" {
  default = true
}

variable "env_name" {
  default = "uat"
  type    = string
}

variable "user_name" {
  default = "ivan"
  type    = string
}

variable "cluster_index" {
  default = "001"
}

variable "acrprefix" {
  default     = "labsacr"
  description = "The prefix used for all resources in this example"
}

variable "location_pair" {
  default = ""
}

variable "tags" {
  default = {
    "ApplicationName"    = "labs Cloud Services Manticore"
    "ApplicationTag"     = "lan=bs Cloud"
    "Capability"         = "Network and Cloud Services"
    "DataClassification" = "Confidential"
    "Environment"        = "Sandbox UAT"
    "Lifespan"           = "Temporaly"
    "OwnerEmail"         = "juanfelipe.lopez@rockwellautomation.com"
    "ProjectInitiative"  = "Default Project"
    "ServiceClass"       = "User Managed"
  }
}

########## Default node pool ##########
variable "node_pool_name" {
  default = "linuxnp"
  type    = string
}
variable "node_pool_vm_size" {
  default = "Standard_E4as_v4"
  type    = string
}
variable "node_pool_vm_size_wks" {
  default = "Standard_E4as_v4"
  type    = string
}
variable "node_pool_vm_size_win" {
  default = "Standard_E4as_v4"
  type    = string
}
variable "node_pool_vm_size_win_test" {
  default = "Standard_D8ads_v5"
  type    = string
}
variable "node_pool_count" {
  default = 2
  type    = number
}
variable "os_disk_size_gb" {
  default = 64
  type    = number
}
variable "os_disk_size_gb_wks" {
  default = 64
  type    = number
}
variable "os_disk_size_gb_win" {
  default = 150
  type    = number
}
variable "os_disk_size_gb_win_test" {
  default = 150
  type    = number
}
variable "os_sku_win" {
  default = "Windows2019"
  type    = string
}
variable "os_sku_win_test" {
  default = "Windows2019"
  type    = string
}
variable "node_pool_availability_zone" {
  default = ["1", "2", "3"]
  type    = list(string)
}
variable "node_pool_max_count" {
  default = 2
  type    = number
}
variable "node_pool_min_count" {
  default = 1
  type    = number
}
variable "node_pool_type" {
  default = "VirtualMachineScaleSets"
  type    = string
}
variable "node_pool_max_pods" {
  default = 75
}
variable "node_pool_max_pods_wks" {
  default = 50
}
variable "node_pool_max_pods_win" {
  default = 50
}
variable "node_pool_max_pods_win_test" {
  default = 50
}
variable "windows_support" {
  default = false
}
variable "win_node_pool_name" {
  default = "winnp"
}
variable "windows_test_support" {
  default = false
}
variable "win_test_node_pool_name" {
  default = "winnpt"
}
variable "container_insights_manage" {
  default = false
}
variable "base_manage" {
  default = false
}

variable "docker_container_secret_name" {
  default = "lab-creg"
}
variable "docker_container_secret_namespace" {
  default = "lab-system"
}

variable "base_infra_namespace_with_istio_inject" {
  type    = list(string)
  default = ["lab-system", "lab-monitoring"]
}

variable "base_infra_namespace_without_istio_inject" {
  type    = list(string)
  default = ["istio-system", "cert-manager"]
}

variable "tfstate_rg" {
  default     = "terraform-rg"
  type        = string
  description = "The name of the resource group where the Terraform state file is stored."

}
variable "tfstate_storage_account_name" {
  default     = "tfstate26035"
  type        = string
  description = "The name of the storage account where the Terraform state file is stored."
}
variable "tfstate_container_name" {
  default     = "tfstate"
  type        = string
  description = "The name of the container where the Terraform state file is stored."
}
variable "tfstate_key" {
  default     = "terraform.tfstate"
  type        = string
  description = "The name of the key for the Terraform state file."
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}
