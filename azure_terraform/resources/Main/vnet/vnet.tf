resource "azurerm_virtual_network" "arch_vnet" {
  resource_group_name = var.rg_name
  name = var.vnet_name
  location = var.location_name
  address_space = [ var.vnet_cidr ]

}

resource "azurerm_subnet" "Web-app" {
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.arch_vnet.name
  name = "PrivateSubnetForRestrictedAccess"
  address_prefixes = [ var.private_cidr ]
}

resource "azurerm_subnet" "app-sub" {
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.arch_vnet.name
  name = "PrivateSubnetForRestrictedAccesstoapp"
  address_prefixes = [ var.private_app_cidr ]
}

resource "azurerm_subnet" "db-app" {
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.arch_vnet.name
  name = "PrivateSubnetForRestrictedAccesstoDB"
  address_prefixes = [ var.private_db_cidr ]
}


