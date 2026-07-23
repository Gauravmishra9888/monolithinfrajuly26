resource "azurerm_network_interface" "nic"{
for_each = var.child_nic
resource_group_name = each.value.rg_name
name = each.value.nic_name
location = each.value.location


dynamic "ip_configuration" {

for_each = each.value.ip_conf
content {
     name                          = ip_configuration.value.name
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id 
    private_ip_address_allocation = ip_configuration.value.ip_allocation
}
 
}
}

data "azurerm_subnet" "subnet-data" {

    for_each = var.child_nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}