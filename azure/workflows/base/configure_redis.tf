module "redis_cache" {
  source                  = "../../modules/redis"
  redis_cache_name        = local.redis_name
  resource_group_name     = local.rg_k8s
  rg_name                 = local.rg_k8s
  location                = var.location
  redis_cache_name_prefix = var.redis_cache_name_prefix
  sku_name                = var.redis_sku_name
  family                  = var.family
  capacity                = var.capacity
  enable_non_ssl_port     = var.enable_non_ssl_port
  minimum_tls_version     = var.minimum_tls_version
  #depends_on = [module.k8s_rg]
}

output "redis_hostname" {
  value = module.redis_cache.redis_cache_hostname
}

output "redis_ssl_port" {
  value = module.redis_cache.redis_cache_ssl_port
}
output "redis_primary_access_key" {
  value     = module.redis_cache.redis_cache_primary_access_key
  sensitive = true
}
output "redis_secondary_access_key" {
  value     = module.redis_cache.redis_cache_secondary_access_key
  sensitive = true
}