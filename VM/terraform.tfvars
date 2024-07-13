vm = {

  vm1 = {

    nic_name             = "vm-nic1"
    location             = "West Europe"
    resource_group_name  = "private-rg"
    vm_name              = "vm-1"
    size                 = "Standard_F2"
    admin_username       = "adminuser"
    admin_password       = "1y^lqs0L5c6C"
    sub-name             = "frontend-subnet"
    virtual_network_name = "frontend-vnet"

  }



  vm2 = {

    nic_name             = "vm-nic2"
    location             = "West Europe"
    resource_group_name  = "private-rg"
    vm_name              = "vm-2"
    size                 = "Standard_F2"
    admin_username       = "adminuser"
    admin_password       = "1y^lqs0L5c6C"
    sub-name             = "frontend-subnet"
    virtual_network_name = "frontend-vnet"


  }




}
