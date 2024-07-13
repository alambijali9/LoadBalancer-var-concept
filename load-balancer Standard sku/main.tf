
resource "azurerm_public_ip" "pip-lb" {

  name                = var.lb.pip-name
  location            = var.lb.location
  resource_group_name = var.lb.resource_group_name
  allocation_method   = var.lb.allocation_method
  sku                 = var.lb.pip-sku
}

resource "azurerm_lb" "load-balancer" {


  name                = var.lb.lb-name
  location            = var.lb.location
  resource_group_name = var.lb.resource_group_name
  sku                 = var.lb.lb-sku

  frontend_ip_configuration {
    name                 = var.lb.frontend-pip-name
    public_ip_address_id = azurerm_public_ip.pip-lb.id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {

  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = var.lb.backend-pool-name
}


resource "azurerm_lb_backend_address_pool_address" "nic1-pool" {
  name                    = var.lb.lb_bkpool-address-name-1
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet-data.id
  ip_address              = data.azurerm_network_interface.nic-1.private_ip_address
}


resource "azurerm_lb_backend_address_pool_address" "nic2-pool" {
  name                    =  var.lb.lb_bkpool-address-name-2
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet-data.id
  ip_address              = data.azurerm_network_interface.nic-2.private_ip_address
}


resource "azurerm_lb_probe" "health" {

  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "ssh-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "example" {

  loadbalancer_id                = azurerm_lb.load-balancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.lb.frontend-pip-name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool.id]
  probe_id                       = azurerm_lb_probe.health.id
}
