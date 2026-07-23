variable "child_nic" {
  type = map(object({
    rg_name     = string
    location    = string
    nic_name    = string
    subnet_name = string
    vnet_name   = string
    ip_conf = map(object({
      name          = string
      ip_allocation = string
    }))
  }))


}
