# Create Global Virtual Network
resource "azurerm_virtual_network" "global_vnet" {
  name                = "global-vnet"
  location            = var.location
  resource_group_name = module.k8s_rg.name
  address_space       = ["10.0.0.0/8"]

  tags = var.tags
}

# Public IP for the Application Gateway
resource "azurerm_public_ip" "app_gw_pip" {
  name                = "${local.app_gw_name}-pip"
  location            = var.location
  resource_group_name = module.k8s_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Create subnet specifically for Application Gateway
resource "azurerm_subnet" "app_gateway_subnet" {
  name                 = "${local.app_gw_name}-subnet"
  resource_group_name  = module.k8s_rg.name
  virtual_network_name = azurerm_virtual_network.global_vnet.name
  address_prefixes     = ["10.1.10.0/24"]
}

module "app_gateway" {
  source              = "../../modules/app-gateway"
  app_gw_name         = local.app_gw_name
  location            = var.location
  resource_group_name = local.rg_k8s
  sku_name            = "Standard_v2"
  sku_tier            = "Standard_v2"
  capacity            = 2
  subnet_id           = azurerm_subnet.app_gateway_subnet.id
  public_ip_id        = azurerm_public_ip.app_gw_pip.id

  depends_on = [module.k8s, azurerm_subnet.app_gateway_subnet]

  # backend pool (PENDING)

  backend_fqdns = [
    "app1.internal.contoso.com",
    "app2.internal.contoso.com"
  ]

  tags = {
    environment = var.env_name
    project     = "manticore-infra"
  }
}
