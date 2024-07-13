data "azurerm_subnet" "sub-data" {
  for_each = var.vm
  name                 = each.value.sub-name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}