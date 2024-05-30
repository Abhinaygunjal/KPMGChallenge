terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "remoteterrabackend"
    container_name       = "terraformtfstatefile"
    key = "terraform.tfstate"
    access_key = ""
  }
}

provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source = "./resourcegroup"
  rg_location = var.location_name
  rg_name = var.rg_name
}

module "vnet" {
  source = "./vnet"
  rg_name = module.resourcegroup.resource_group_name
  location_name = module.resourcegroup.location_name
  vnet_name = var.vnet_name
  vnet_cidr = var.vnet_cidr
  private_cidr = var.private_cidr
  depends_on = [ module.resourcegroup ]
  private_db_cidr = var.private_db_cidr
  private_app_cidr = var.private_app_cidr
}

module "FE-VM" {
  source = "./VM"
  web_subnet_id = module.vnet.privateid
  web_vm_name = "FE-web"
  rg_name = var.rg_name
  rg_location = var.location_name
  web_username = "Abhinay"
  web_host_name = "hostname"
  web_pass = "9898512987Abcd7&"
  db_subnet_id = module.vnet.db_subnet_id
  app_subnet_id = module.vnet.app_subnet_id
}




module "NSGs" {
  source = "../NSGs"
  rg_location = var.location_name
  rg_name = var.rg_name
  privateid = module.vnet.privateid
  app_subnet_id = module.vnet.app_subnet_id
  db_subnet_id = module.vnet.db_subnet_id
}
