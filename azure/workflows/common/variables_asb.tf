# variable "rg_name" {
#   type        = string
#   description = "Name of the resource group to deploy resources into"
#   default     = "rg-ede-labenv"
# }


variable "name" {
  type        = string
  description = "Name of the Service Bus namespace"
  default     = "asb"
}


variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy resources into"
  default     = "rg-ede-labenv"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "SKU for Service Bus namespace. Allowed values: Basic, Standard, Premium"
}

variable "queues" {
  type        = list(string)
  default     = []
  description = "List of Service Bus queues to create"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "List of Service Bus topics to create"
}

variable "subscriptions" {
  description = "List of topic subscriptions"
  type = list(object({
    topic = string
    name  = string
  }))
  default = []
}

variable "subscription_rules" {
  description = "Rules to apply to subscriptions"
  type = list(object({
    topic        = string
    subscription = string
    name         = string
    rule_type    = string # Typically "SqlFilter"
    filter_type  = string # Typically "SqlFilter"
    sql_filter   = string # Example: "priority = 'high'"
  }))
  default = []
}

