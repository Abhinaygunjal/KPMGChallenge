variable "rg_name" {
    type = string  
}
variable "vnet_name" {
  type = string
}
variable "location_name" {
  type = string
}
variable "vnet_cidr" {}  
variable "private_cidr" {}
variable "private_app_cidr" {}
variable "private_db_cidr" {}