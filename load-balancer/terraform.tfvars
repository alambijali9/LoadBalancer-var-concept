

lb = {

  pip-name                 = "PublicIPForLB"
  location                 = "West Europe"
  resource_group_name      = "private-rg"
  allocation_method        = "Static"
  pip-sku                  = "Standard"
  lb-name                  = "FrontendLoadBalancer"
  lb-sku                   = "Standard"
  frontend-pip-name        = "frontend-pip"
  backend-pool-name        = "Backendpool"
  vnet-name                = "frontend-vnet"
  lb_bkpool-address-name-1 = "backend-nic-address1"
  lb_bkpool-address-name-2 = "backend-nic-address2"
  data-nic1-name           = "vm-nic1"
  data-nic2-name           = "vm-nic2"





}








