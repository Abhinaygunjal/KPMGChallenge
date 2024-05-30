resource "azurerm_resource_group" "arch_test" {
  name = var.rg_name
  location = var.rg_location
  tags = {
    env: "testing"   
  }
}