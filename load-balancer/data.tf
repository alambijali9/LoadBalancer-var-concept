
data "azurerm_virtual_network" "vnet-data" {
  name                = var.lb.vnet-name
  resource_group_name = var.lb.resource_group_name
}

data "azurerm_network_interface" "nic-1" {
  name                = var.lb.data-nic1-name
  resource_group_name = var.lb.resource_group_name
}
data "azurerm_network_interface" "nic-2" {
  name                =  var.lb.data-nic2-name
  resource_group_name = var.lb.resource_group_name
}