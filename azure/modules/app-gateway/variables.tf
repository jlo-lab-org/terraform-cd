variable "app_gw_name" {
  type        = string
  description = "The name of the Application Gateway."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for Application Gateway."
}

variable "location" {
  type        = string
  description = "Azure region for the Application Gateway."
}

variable "sku_name" {
  type        = string
  description = "SKU Name (Standard_Small, Standard_Medium, WAF_v2, etc.)."
  default     = "Standard_v2"
}

variable "sku_tier" {
  type        = string
  description = "SKU Tier (Standard, WAF, Standard_v2, WAF_v2)."
  default     = "Standard_v2"
}

variable "capacity" {
  type        = number
  description = "Number of Application Gateway instances."
  default     = 2
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the Application Gateway."
}

variable "public_ip_id" {
  type        = string
  description = "Public IP Address ID associated with the Application Gateway."
}

variable "backend_fqdns" {
  type        = list(string)
  description = "List of backend fully qualified domain names."
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources."
  default     = {}
}
