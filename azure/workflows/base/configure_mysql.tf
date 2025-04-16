module "mysql" {
  source              = "../../modules/mysql"
  resource_group_name = local.rg_k8s
  rg_name             = local.rg_k8s
  location            = var.location
  tags                = var.tags

  mysql_server_name = local.mysql_server_name
  admin_username    = var.mysql_admin_username
  # The password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.
  admin_password = var.mysql_admin_password
  mysql_version  = var.mysql_version
  database_name  = var.database_name
  sku_name       = var.sku_name
  #depends_on = [module.k8s_rg]
}

output "mysql_fqdn" {
  value = module.mysql.mysql_server_fqdn

}