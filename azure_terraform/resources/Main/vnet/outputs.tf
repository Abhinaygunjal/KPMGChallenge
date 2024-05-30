output "vnet_name" {
  value = azurerm_virtual_network.arch_vnet.name
  description = "Name of the Virtual network"
}

output "privateid" {
  value = azurerm_subnet.Web-app.id
  description = "private identifier for webapp"
}

output "app_subnet_id" {
  value = azurerm_subnet.app-sub.id
  description = "private identifier for app"
}

output "db_subnet_id" {
  value = azurerm_subnet.db-app.id
  description = "private identifier for DBapp"
}

