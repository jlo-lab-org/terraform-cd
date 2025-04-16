module "cosmosdb-mongo" {
  source                = "../../modules/cosmosdb-mongodb"
  resource_group_name   = local.rg_k8s
  rg_name               = local.rg_k8s
  location              = var.location
  cosmosdb_account_name = local.cosmosdb_server_name

  mongo_database_name = var.mongo_database_name
  database_throughput = var.database_throughput
  #depends_on = [module.k8s_rg]
}