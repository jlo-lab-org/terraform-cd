output "application_gateway_id" {
  value = azurerm_application_gateway.app_gw.id
}

output "application_gateway_fqdn" {
  value = azurerm_application_gateway.app_gw.frontend_ip_configuration[0].public_ip_address_id
}
