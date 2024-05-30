resource "azurerm_availability_set" "web_availabilty_set" {
  name                = "web_availabilty_set"
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_network_interface" "web-net-interface" {
    name = "web-network"
    resource_group_name = var.rg_name
    location = var.rg_location

    ip_configuration{
        name = "web-webserver"
        subnet_id = var.web_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "web-vm" {
  name = "web-vm"
  location = var.rg_location
  resource_group_name = var.rg_name
  network_interface_ids = [ azurerm_network_interface.web-net-interface.id ]
  availability_set_id = azurerm_availability_set.web_availabilty_set.id
  vm_size = "Standard_B1s"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "web-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "hostname"
    admin_username = "Abhinay"
    admin_password = "9898512987Abcd7&"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}



#app VM config

  resource "azurerm_availability_set" "app_availabilty_set" {
  name                = "app_availabilty_set"
  location            = var.rg_location
  resource_group_name = var.rg_name
 }

resource "azurerm_network_interface" "app-net-interface" {
    name = "app-network"
    resource_group_name = var.rg_name
    location = var.rg_location

    ip_configuration{
        name = "app-webserver"
        subnet_id = var.app_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "app-vm" {
  name = "app-vm"
  location = var.rg_location
  resource_group_name = var.rg_name
  network_interface_ids = [ azurerm_network_interface.app-net-interface.id ]
  availability_set_id = azurerm_availability_set.app_availabilty_set.id
  vm_size = "Standard_B1s"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "app-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "AppServer"
    admin_username = "Abhinay"
    admin_password = "9898688577Abcd7&"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}



  resource "azurerm_availability_set" "db_availabilty_set" {
  name                = "db_availabilty_set"
  location            = var.rg_location
  resource_group_name = var.rg_name
 }

resource "azurerm_network_interface" "db-net-interface" {
    name = "db-network"
    resource_group_name = var.rg_name
    location = var.rg_location

    ip_configuration{
        name = "db-webserver"
        subnet_id = var.db_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "db-vm" {
  name = "db-vm"
  location = var.rg_location
  resource_group_name = var.rg_name
  network_interface_ids = [ azurerm_network_interface.db-net-interface.id ]
  availability_set_id = azurerm_availability_set.db_availabilty_set.id
  vm_size = "Standard_B1s"
  delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "db-disk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "DB"
    admin_username = "abhinay"
    admin_password = "retwrsdk3&"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}