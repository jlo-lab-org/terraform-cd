variable "rg_name" {}


variable "asb_name" {
  type        = string
  description = "Name of the Service Bus namespace"
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "sku" {
  type        = string
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
    max_delivery_count = optional(number, 10) # Default value for max_delivery_count
  }))
  default = []
}

variable "subscription_rules" {
  description = "Rules to apply to subscriptions"
  type = list(object({
    topic        = string
    subscription = string
    name         = string
    rule_type    = string        # Typically "SqlFilter"
    filter_type  = string        # Typically "SqlFilter"
    sql_filter   = string        # Example: "priority = 'high'"
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
}
