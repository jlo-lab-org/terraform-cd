variable "redis_cache_name" {
  description = "Name of the Azure Redis Cache"
  type        = string
  default     = "redis-server"
}
variable "redis_cache_name_suffix" {
  description = "Random suffix for the Redis Cache name"
  type        = string
  default     = "redis-cache-suffix"
}
variable "redis_cache_name_suffix_length" {
  description = "Length of the random suffix for the Redis Cache name"
  type        = number
  default     = 5
}
variable "redis_sku_name" {
  description = "Redis Cache SKU name (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "family" {
  description = "SKU family (C for Basic/Standard, P for Premium)"
  type        = string
  default     = "C"
}

variable "capacity" {
  description = "Redis Cache capacity (0-6, where 0 is 250MB, 1 is 1GB, etc.)"
  type        = number
  default     = 0
}

variable "enable_non_ssl_port" {
  description = "Enable non-SSL port (6379) for Redis Cache"
  type        = bool
  default     = false

}
variable "minimum_tls_version" {
  description = "Minimum TLS version for Redis Cache"
  type        = string
  default     = "1.2"
}

variable "redis_cache_name_prefix" {
  description = "Prefix for the Azure Redis Cache name"
  type        = string
  default     = "appcache"

}
